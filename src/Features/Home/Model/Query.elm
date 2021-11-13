module Features.Home.Model.Query exposing (queryHomeFeatureContent, parseHomeFeatureContent)

import Array exposing (Array)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))
import Features.Home.Model.Config exposing (config)

import Model.PostMeta.Query exposing (queryPostMeta)
import Model.PostMetaItems.Query exposing (queryPostMetaItems)
import Model.PostMeta.Decoder exposing (decodePostMeta)
import Model.PostMetaItems.Decoder exposing (decodePostMetaItems)
import Features.Home.Model.Types exposing (HomeFeatureContent)

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

queryHomeFeatureContent : Model -> Cmd Message
queryHomeFeatureContent model =
  case (model.featureData.step) of
    0 -> queryPostMetaItems config.metaNames.step config.steps
    1 ->
      let
        metaItemNames = getPostMetaItemNames model
        messages = List.map (queryPostMeta config.meta.step config.steps) metaItemNames
      in
        Cmd.batch messages
    _ -> Cmd.none

parseHomeFeatureContent : Array String -> HomeFeatureContent
parseHomeFeatureContent content =
  let
    posts = List.drop 1 (Array.toList content)
  in
    List.map (decodePostMeta) (List.map Just posts)
