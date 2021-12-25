module Utils.Markdown.CustomParser exposing (parseWithCustomElements)

import Html exposing (Html)
import Core.Message exposing (Message)

import Html.Attributes exposing (..)
import Markdown.Block exposing (Block(..))
import Markdown.Inline exposing (Inline(..))
import Utils.Markdown.CustomCodeBlock exposing (customCodeBlock)

customHtmlBlock : Block b i -> List (Html Message)
customHtmlBlock block =
    case block of
      CodeBlock meta value ->
        [ customCodeBlock
            { meta = meta
            , value = String.replace "\n" "\r\n" value
            }
        ]
      _ ->
        Markdown.Block.defaultHtml
          (Just customHtmlBlock)
          (Just customHtmlInline)
          block

customHtmlInline : Inline i -> Html Message
customHtmlInline inline =
    case inline of
      _ ->
        Markdown.Inline.defaultHtml (Just customHtmlInline) inline

parseWithCustomElements : String -> List (Html Message)
parseWithCustomElements markdown =
  markdown
    |> Markdown.Block.parse Nothing
    |> List.map (customHtmlBlock)
    |> List.concat
