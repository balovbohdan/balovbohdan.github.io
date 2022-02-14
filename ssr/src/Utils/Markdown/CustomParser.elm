module Utils.Markdown.CustomParser exposing (parseWithCustomElements)

import Html exposing (Html)

import Html.Attributes exposing (..)
import Markdown.Block exposing (Block(..))
import Markdown.Inline exposing (Inline(..))
import Utils.Markdown.CustomCodeBlock exposing (customCodeBlock)

customHtmlBlock : Block b i -> List (Html message)
customHtmlBlock block =
    case block of
      CodeBlock meta value -> [ customCodeBlock { meta = meta, value = value } ]
      _ ->
        Markdown.Block.defaultHtml
          (Just customHtmlBlock)
          (Just customHtmlInline)
          block

customHtmlInline : Inline i -> Html message
customHtmlInline inline =
    case inline of
      _ ->
        Markdown.Inline.defaultHtml (Just customHtmlInline) inline

parseWithCustomElements : String -> List (Html message)
parseWithCustomElements markdown =
  markdown
    |> Markdown.Block.parse Nothing
    |> List.map (customHtmlBlock)
    |> List.concat
