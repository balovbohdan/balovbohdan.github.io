module Features.Blog.Model.Query exposing (queryPostsFeatureContent, parsePostsFeatureContent)

import Array exposing (Array)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))
import Features.Blog.Model.Config exposing (config)

import Model.PostMeta.Query exposing (queryPostMeta)
import Model.PostMetaItems.Query exposing (queryPostMetaItems)
import Model.PostMeta.Decoder exposing (decodePostMeta)
import Model.PostMetaItems.Decoder exposing (decodePostMetaItems)
import Features.Blog.Model.Types exposing (PostsFeatureContent)

getPostMetaItemNames : Model -> List String
getPostMetaItemNames model =
  let
    data = Array.get 0 model.featureData.content
  in
    case (data) of
      Nothing -> []
      Just result ->
        case (decodePostMetaItems result) of
          Ok metaItems -> List.map (\metaItem -> metaItem.name) metaItems
          Err _ -> []

queryPostsFeatureContent : Model -> Cmd Message
queryPostsFeatureContent model =
  case (model.featureData.step) of
    0 -> queryPostMetaItems config.metaNames.step config.steps
    1 ->
      let
        metaItemNames = getPostMetaItemNames model
        messages = List.map (queryPostMeta config.meta.step config.steps) metaItemNames
      in
        Cmd.batch messages
    _ -> Cmd.none

parsePostsFeatureContent : Array String -> PostsFeatureContent
parsePostsFeatureContent content =
  let
    posts = List.drop 1 (Array.toList content)
  in
    List.map (decodePostMeta) (List.map Just posts)
