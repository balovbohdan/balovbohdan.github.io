module Core.Utils.PageTitle exposing (getPageTitle)

import Array

import Core.Model.Types exposing (Model)
import Model.PostMeta.Decoder exposing (decodePostMeta)

defaultTitle : String
defaultTitle = "Mr. Balov | Personal Blog"

getPageTitle : Model -> String
getPageTitle model =
  let
    pathPartsRaw = String.split "/" model.url.path
    pathParts = List.filter (\pathPart -> pathPart /= "") pathPartsRaw
    firstPathPart = Maybe.withDefault "" (List.head pathParts)
  in
    case (firstPathPart) of
      "posts" ->
        let
          postMetaRaw = Array.get 1 model.featureData.content
          postMetaDecoded = decodePostMeta postMetaRaw
          postTitle = if postMetaDecoded.title == "" then "Awesome Article..." else postMetaDecoded.title
        in
          postTitle ++ " | Mr. Balov"
      "" -> defaultTitle
      _ -> defaultTitle
