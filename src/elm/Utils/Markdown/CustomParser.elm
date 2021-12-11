module Utils.Markdown.CustomParser exposing (parseWithCustomElements)

import Html exposing (div, node, Html)
import Core.Message exposing (Message)

import Html.Attributes exposing (..)
import Markdown.Block exposing (Block(..))
import Markdown.Inline exposing (Inline(..))

customHtmlBlock : Block b i -> List (Html Message)
customHtmlBlock block =
    case block of
      CodeBlock b1 b2 -> [node "code-mirror" [] []]
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
