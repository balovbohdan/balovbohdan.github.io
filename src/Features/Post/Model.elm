module Features.Post.Model exposing (queryPostFeatureContent, parsePostFeatureContent)

import Http
import Json.Decode

import Core.Message exposing (Message(..))

type alias PostFeatureContent = { name: String }

queryPostFeatureContent : Cmd Message
queryPostFeatureContent =
  Http.get
    { url = "https://api.github.com/repos/balovbohdan/mr-balov-blog/dist/content/blog/why-i-decided-to-drop-react.md"
    , expect = Http.expectString MessageFeatureContentReceived
    }

postFeatureContentDecoder : Json.Decode.Decoder PostFeatureContent
postFeatureContentDecoder =
  Json.Decode.map PostFeatureContent (Json.Decode.field "name" Json.Decode.string)

decodePostFeatureContent : String -> Result Json.Decode.Error PostFeatureContent
decodePostFeatureContent content =
  Json.Decode.decodeString postFeatureContentDecoder content

parsePostFeatureContent : String -> PostFeatureContent
parsePostFeatureContent content =
  case (decodePostFeatureContent content) of
    Ok result -> result
    Err _ -> { name = "Oops! Error happened..." }
