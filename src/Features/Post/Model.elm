module Features.Post.Model exposing (decodePostMeta, queryPostFeatureContent, parsePostFeatureContent)

import Http
import Base64
import Json.Decode

import Core.Message exposing (Message(..))
import Array

type alias PostFeatureContent = { name: String, content: String }

type alias PostMeta =
  { title: String
  , description: String
  , keywords: List String
  }

queryPostFeatureContent : String -> Cmd Message
queryPostFeatureContent id =
  Http.get
    { url = "https://api.github.com/repos/balovbohdan/mr-balov-blog/contents/docs/content/blog/" ++ id ++ ".md"
    , expect = Http.expectString MessageFeatureContentReceived
    }

postFeatureContentDecoder : Json.Decode.Decoder PostFeatureContent
postFeatureContentDecoder =
  Json.Decode.map2 PostFeatureContent
    (Json.Decode.field "name" Json.Decode.string)
    (Json.Decode.field "content" Json.Decode.string)

decodePostMetaItem : Maybe String -> String
decodePostMetaItem metaItem =
  case (metaItem) of
    Nothing -> ""
    Just value -> value

decodePostMeta : String -> PostMeta
decodePostMeta text =
  let
    metaItems = Array.fromList (List.take 8 (String.lines text))
  in
    { title = decodePostMetaItem (Array.get 1 metaItems)
    , description = decodePostMetaItem (Array.get 2 metaItems)
    , keywords = String.split "," (decodePostMetaItem (Array.get 3 metaItems))
    }

decodePostText : String -> String
decodePostText text =
  let
    formattedText = String.concat (List.drop 7 (String.lines text))
  in
    case (Base64.decode formattedText) of
      Ok result -> result
      Err _ -> ""

decodePostFeatureContent : String -> Result Json.Decode.Error PostFeatureContent
decodePostFeatureContent content =
  Json.Decode.decodeString postFeatureContentDecoder content

parsePostFeatureContent : String -> PostFeatureContent
parsePostFeatureContent content =
  case (decodePostFeatureContent content) of
    Ok result ->
      { name = result.name
      , content = decodePostText result.content
      }
    Err _ -> { name = "Oops! Error happened...", content = "" }
