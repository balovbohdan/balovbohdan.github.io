module Model.PostMeta.Query exposing (queryPostMeta)

import OptimizedDecoder
import Pages.Secrets
import DataSource.Http
import DataSource exposing (DataSource)
import Model.PostMeta.Decoder exposing (decodePostMeta, postMetaDecoder)
import Model.PostMeta.Constants exposing (constants)
import Model.PostMeta.Types exposing (PostMeta, PostMetaRaw)

rawDecoder: OptimizedDecoder.Decoder PostMetaRaw
rawDecoder =
  OptimizedDecoder.map2
    PostMetaRaw
    (OptimizedDecoder.field "name" OptimizedDecoder.string)
    (OptimizedDecoder.field "content" OptimizedDecoder.string)

queryPostMeta: String -> DataSource PostMetaRaw
queryPostMeta postId =
  let
    url = constants.postMetaUrl ++ postId ++ ".md?ref=github-page"
  in
    DataSource.Http.get
      (Pages.Secrets.succeed url)
      postMetaDecoder
