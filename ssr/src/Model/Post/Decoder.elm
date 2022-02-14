module Model.Post.Decoder exposing (postDecoder)

import Base64
import Json.Decode

import Model.Post.Types exposing (Post, PostRaw)

defaultPost : Post
defaultPost = { name = "", text = "" }

decodePostText : String -> String
decodePostText input =
  let
    formattedText = String.concat (String.lines input)
  in
    case (Base64.decode formattedText) of
      Ok result -> result
      Err _ -> defaultPost.text

postDecoder : Json.Decode.Decoder PostRaw
postDecoder =
  Json.Decode.map2
    PostRaw
    (Json.Decode.field "name" Json.Decode.string)
    (Json.Decode.field "content" Json.Decode.string)

-- decodePost : Maybe String -> Post
-- decodePost input =
--   case (input) of
--     Nothing -> defaultPost
--     Just value ->
--       case (Json.Decode.decodeString postDecoder value) of
--         Err _ -> defaultPost
--         Ok post ->
--           { name = post.name
--           , text = decodePostText post.content
--           }
