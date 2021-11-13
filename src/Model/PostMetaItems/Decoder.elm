module Model.PostMetaItems.Decoder exposing (decodePostMetaItems)

import Json.Decode

import Model.PostMetaItems.Types exposing (PostMetaItem)

postMetaItemDecoder : Json.Decode.Decoder PostMetaItem
postMetaItemDecoder =
  Json.Decode.map PostMetaItem (Json.Decode.field "name" Json.Decode.string)

decodePostMetaItems : String -> Result Json.Decode.Error (List PostMetaItem)
decodePostMetaItems input =
  Json.Decode.decodeString (Json.Decode.list postMetaItemDecoder) input
