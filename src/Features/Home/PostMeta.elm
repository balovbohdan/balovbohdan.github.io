module Features.Home.PostMeta exposing (decodePostMeta, defaultPostMeta)

import Base64
import Array exposing (Array)

import Features.Home.Types exposing (PostMeta)

defaultPostMeta : PostMeta
defaultPostMeta = { title = "", description = "", keywords = "", cover = "" }

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

decodePostMeta : String -> PostMeta
decodePostMeta table =
  let
    formattedTable = String.concat (List.drop 0 (String.lines table))
  in
    case (Base64.decode formattedTable) of
      Err _ -> defaultPostMeta
      Ok result ->
        let
          lines = getMetaLines result
        in
          { title = getMetaItem 1 lines
          , description = getMetaItem 3 lines
          , keywords = getMetaItem 5 lines
          , cover = getMetaItem 7 lines
          }
