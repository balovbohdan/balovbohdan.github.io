module Features.Home.Model exposing (queryHomeFeatureContent, parseHomeFeatureContent, Post, HomeFeatureContent)

import Http
import Array
import Json.Decode

import Core.Model exposing (Model)
import Core.Message exposing (Message(..))

type alias Post = { name: String }

type alias HomeFeatureContent = List Post

type alias MetaListItem = { name: String }

metaListItemDecoder : Json.Decode.Decoder MetaListItem
metaListItemDecoder =
  Json.Decode.map MetaListItem (Json.Decode.field "name" Json.Decode.string)

decodeMetasList : String -> Result Json.Decode.Error (List MetaListItem)
decodeMetasList input =
  Json.Decode.decodeString (Json.Decode.list metaListItemDecoder) input

getMetasList : Maybe String -> List MetaListItem
getMetasList input =
  case (input) of
    Nothing -> []
    Just value ->
      case (decodeMetasList value) of
        Ok result -> result
        Err _ -> []

queryMetasList : Cmd Message
queryMetasList =
  Http.get
    { url = "https://api.github.com/repos/balovbohdan/mr-balov-blog/contents/docs/content/blog/metas"
    , expect = Http.expectString (MessageFeatureContentPartReceived 1)
    }

queryMeta : MetaListItem -> Cmd Message
queryMeta metaItem =
  Http.get
    { url = "https://api.github.com/repos/balovbohdan/mr-balov-blog/contents/docs/content/blog/metas/" ++ Debug.log "q" (metaItem.name)
    , expect = Http.expectString (MessageFeatureContentPartReceived 1)
    }

queryHomeFeatureContent : Model -> Cmd Message
queryHomeFeatureContent model =
  case (model.featureData.step) of
    0 -> queryMetasList
    1 ->
      let
        metasList = getMetasList (Array.get 0 (Array.fromList model.featureData.stepAccumulator))
        messages = List.map queryMeta metasList
        areAllMetasQueried = (List.length model.featureData.stepAccumulator) >= (List.length metasList)
      in
        if areAllMetasQueried then
          Cmd.none
        else
          Cmd.batch messages
    _ -> Cmd.none

homeFeatureContentDecoder : Json.Decode.Decoder Post
homeFeatureContentDecoder =
  Json.Decode.map Post (Json.Decode.field "name" Json.Decode.string)

decodeHomeFeatureContent : String -> Result Json.Decode.Error HomeFeatureContent
decodeHomeFeatureContent content =
  Json.Decode.decodeString (Json.Decode.list homeFeatureContentDecoder) content

parseHomeFeatureContent : String -> HomeFeatureContent
parseHomeFeatureContent content =
  case (decodeHomeFeatureContent content) of
    Ok result -> result
    Err _ -> []
