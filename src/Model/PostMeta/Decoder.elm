module Model.PostMeta.Decoder exposing (decodePostMeta, defaultPostMeta)

import Base64
import Json.Decode
import Array exposing (Array)

import Model.PostMeta.Types exposing (PostMeta, PostMetaRaw)

defaultPostMeta : PostMeta
defaultPostMeta = { name = "", title = "", description = "", keywords = "", cover = "" }

getIsNotEmptyString : String -> Bool
getIsNotEmptyString string = (String.length string) > 0

getMetaLines : String -> Array String
getMetaLines =
  String.split "\n"
    >> List.drop 2
    >> List.concatMap (String.split "|")
    >> List.filter getIsNotEmptyString
    >> List.map String.trim
    >> Array.fromList

getMetaItem : Int -> Array String -> String
getMetaItem index items =
  case (Array.get index items) of
    Nothing -> ""
    Just result -> result

postMetaDecoder : Json.Decode.Decoder PostMetaRaw
postMetaDecoder =
  Json.Decode.map2
    PostMetaRaw
    (Json.Decode.field "name" Json.Decode.string)
    (Json.Decode.field "content" Json.Decode.string)

decodePostMeta : Maybe String -> PostMeta
decodePostMeta input =
  case (input) of
    Nothing -> defaultPostMeta
    Just value ->
      case (Json.Decode.decodeString postMetaDecoder value) of
        Err _ -> defaultPostMeta
        Ok postMeta ->
          let
            formattedTable = String.concat (List.drop 0 (String.lines postMeta.content))
          in
            case (Base64.decode formattedTable) of
              Err _ -> defaultPostMeta
              Ok result ->
                let
                  lines = getMetaLines result
                in
                  { name = postMeta.name
                  , title = getMetaItem 1 lines
                  , description = getMetaItem 3 lines
                  , keywords = getMetaItem 5 lines
                  , cover = getMetaItem 7 lines
                  }
