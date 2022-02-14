module Model.Post.Query exposing (queryPost)

import OptimizedDecoder
import Pages.Secrets
import DataSource.Http
import DataSource exposing (DataSource)
import Model.Post.Constants exposing (constants)
import Model.Post.Types exposing (Post, PostRaw)

decoder: OptimizedDecoder.Decoder Post
decoder =
  OptimizedDecoder.map6
    Post
    (OptimizedDecoder.field "name" OptimizedDecoder.string)
    (OptimizedDecoder.field "title" OptimizedDecoder.string)

queryPost: String -> DataSource Post
queryPost postId =
  let
    url = constants.postUrl ++ postId ++ "/" ++ postId ++ ".md?ref=github-page"
  in
    DataSource.Http.get
      (Pages.Secrets.succeed url)
      decoder
