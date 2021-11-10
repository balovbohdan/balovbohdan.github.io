module Features.Home.Post exposing (decodePost)

import Json.Decode

import Features.Home.Types exposing (Post)
import Features.Home.PostMeta exposing (decodePostMeta, defaultPostMeta)

type alias PostRaw = { name: String, content: String }

postDecoder : Json.Decode.Decoder PostRaw
postDecoder =
  Json.Decode.map2
    PostRaw
    (Json.Decode.field "name" Json.Decode.string)
    (Json.Decode.field "content" Json.Decode.string)

decodePost : String -> Post
decodePost content =
  let
    post = Json.Decode.decodeString postDecoder content
  in
    case (post) of
      Ok result -> { name = result.name, meta = decodePostMeta result.content }
      Err _ -> { name = "Error", meta = defaultPostMeta }
