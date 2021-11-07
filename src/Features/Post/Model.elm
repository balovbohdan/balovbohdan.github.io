module Features.Post.Model exposing (queryPostFeatureContent, parsePostFeatureContent)

import Http
import Base64
import Json.Decode

import Core.Message exposing (Message(..))

type alias PostFeatureContent = { name: String, content: String }

queryPostFeatureContent : String -> Cmd Message
queryPostFeatureContent id =
  Http.get
    { url = "https://api.github.com/repos/balovbohdan/mr-balov-blog/contents/dist/content/blog/" ++ id ++ ".md"
    , expect = Http.expectString MessageFeatureContentReceived
    }

postFeatureContentDecoder : Json.Decode.Decoder PostFeatureContent
postFeatureContentDecoder =
  Json.Decode.map2 PostFeatureContent
    (Json.Decode.field "name" Json.Decode.string)
    (Json.Decode.field "content" Json.Decode.string)

decodePostText : String -> String
decodePostText text =
  let
    formattedText = String.replace "\n" "" text
  in
    case (Base64.decode formattedText) of
      Ok result -> result
      Err _ -> "Oops! Error happened..."

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
