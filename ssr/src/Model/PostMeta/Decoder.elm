module Model.PostMeta.Decoder exposing (postMetaDecoder)

import Base64
import Json.Decode
import OptimizedDecoder
import Array exposing (Array)

import Model.PostMeta.Types exposing (PostMeta, PostMetaRaw, PostMetaContent)

defaultPostMeta : PostMeta
defaultPostMeta =
  { name = ""
  , content =
      { title = ""
      , description = ""
      , keywords = ""
      , cover = ""
      , publishedOn = ""
      }
  }

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

-- contentDecoder: OptimizedDecoder.Decoder PostMetaContent
-- contentDecoder =
--   OptimizedDecoder.field "content" OptimizedDecoder.string |>
--   OptimizedDecoder.andThen
--     (\content -> 
--         OptimizedDecoder.succeed
--           { title = "title"
--           , description = "description"
--           , keywords = "keywords"
--           , cover = "cover"
--           , publishedOn = "publishedOn"
--           }
--     )

  -- let
  --   decodedValue = OptimizedDecoder.decodeValue OptimizedDecoder.string value
  -- in
  --   case decodedValue of
  --     Ok v ->
  --       let
  --         formattedTable = String.concat (List.drop 0 (String.lines v))
  --       in
  --         case (Base64.decode formattedTable) of
  --           Err _ -> defaultPostMeta.content
  --           Ok result ->
  --             let
  --               lines = getMetaLines result
  --             in
  --               { title = getMetaItem 1 lines
  --               , description = getMetaItem 3 lines
  --               , keywords = getMetaItem 5 lines
  --               , cover = getMetaItem 7 lines
  --               , publishedOn = getMetaItem 9 lines
  --               }
  --     Err _ -> defaultPostMeta.content

-- proceed here
postMetaDecoder : OptimizedDecoder.Decoder PostMeta
postMetaDecoder =
  (OptimizedDecoder.map2
    PostMetaRaw
    (OptimizedDecoder.field "name" OptimizedDecoder.string)
    (OptimizedDecoder.field "content" OptimizedDecoder.string))
  |> OptimizedDecoder.andThen
    (\content -> 
        OptimizedDecoder.succeed
          { name = "name"
          , content =
            { title = "title"
            , description = "description"
            , keywords = "keywords"
            , cover = "cover"
            , publishedOn = "publishedOn"
            }
          }
      )
