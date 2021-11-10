module Features.Home.PostMetasList exposing (getMetasList)

import Json.Decode
import Array

import Core.Model exposing (Model)
import Features.Home.Types exposing (PostMetaListItem)

metaDecoder : Json.Decode.Decoder PostMetaListItem
metaDecoder =
  Json.Decode.map PostMetaListItem (Json.Decode.field "name" Json.Decode.string)

decodeMetas : String -> Result Json.Decode.Error (List PostMetaListItem)
decodeMetas input =
  Json.Decode.decodeString (Json.Decode.list metaDecoder) input

getMetasList : Model -> List PostMetaListItem
getMetasList model =
  let
    data = Array.get 0 model.featureData.content
  in
    case (data) of
      Nothing -> []
      Just value ->
        case (decodeMetas value) of
          Ok result -> result
          Err _ -> []
