module Features.Post.Model.Query exposing (queryPostFeatureContent, parsePostFeatureContent)

import Array exposing (Array)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))
import Features.Post.Model.Types exposing (PostFeatureContent)
import Features.Post.Model.Config exposing (config)
import Model.Post.Query exposing (queryPost)
import Model.PostMeta.Query exposing (queryPostMeta)
import Model.Post.Decoder exposing (decodePost)
import Model.PostMeta.Decoder exposing (decodePostMeta)

queryPostFeatureContent : Model -> String -> Cmd Message
queryPostFeatureContent model id =
  case (model.featureData.step) of
    0 -> queryPost model config.post.step config.steps id
    1 ->
      case (Array.get 0 model.featureData.content) of
        Nothing -> Cmd.none
        Just content ->
          let
            post = decodePost (Just content)
          in
            queryPostMeta model config.postMeta.step config.steps post.name
    _ -> Cmd.none

parsePostFeatureContent : Array String -> PostFeatureContent
parsePostFeatureContent input =
  { post = decodePost (Array.get 0 input)
  , postMeta = decodePostMeta (Array.get 1 input)
  }
