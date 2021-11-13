module Features.Home.Model exposing (queryHomeFeatureContent, parseHomeFeatureContent)

import Http
import Array exposing (Array)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))
import Features.Home.Config exposing (config)

import Features.Home.Post exposing (decodePost)
import Features.Home.PostMetasList exposing (getMetasList)
import Features.Home.Types exposing (PostMetaListItem, HomeFeatureContent)

queryMetasList : Cmd Message
queryMetasList =
  Http.get
    { url = config.metas.url
    , expect = Http.expectString (MessageFeatureContentReceived config.metas.step config.steps)
    }

queryMeta : PostMetaListItem -> Cmd Message
queryMeta metaItem =
  Http.get
    { url = config.meta.url ++ metaItem.name
    , expect = Http.expectString (MessageFeatureContentReceived config.meta.step config.steps)
    }

queryHomeFeatureContent : Model -> Cmd Message
queryHomeFeatureContent model =
  case (model.featureData.step) of
    0 -> queryMetasList
    1 ->
      let
        metasList = getMetasList model
        messages = List.map queryMeta metasList
      in
        Cmd.batch messages
    _ -> Cmd.none

parseHomeFeatureContent : Array String -> HomeFeatureContent
parseHomeFeatureContent content =
  let
    posts = List.drop 1 (Array.toList content)
  in
    List.map decodePost posts
