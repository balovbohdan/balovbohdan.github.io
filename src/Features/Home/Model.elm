module Features.Home.Model exposing (queryHomeFeatureContent, parseHomeFeatureContent, Post, HomeFeatureContent)

import Http
import Json.Decode

import Core.Message exposing (Message(..))

type alias Post = { name: String }

type alias HomeFeatureContent = List Post

queryHomeFeatureContent : Cmd Message
queryHomeFeatureContent =
  Http.get
    { url = "https://api.github.com/repos/balovbohdan/mr-balov-blog/contents/docs/content/blog"
    , expect = Http.expectString MessageFeatureContentReceived
    }

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
