module Utils.Markdown.Middleware exposing (markdownMiddleware)

import Html exposing (Html)
import Core.Message exposing (Message)

import Html.Attributes exposing (..)
import Markdown.Block exposing (Block(..))
import Markdown.Inline exposing (Inline(..))

customHtmlBlock : Block b i -> List (Html Message)
customHtmlBlock block =
    case block of
      -- CodeBlock b1 b2 -> [div [] []]
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

markdownMiddleware : String -> List (Html Message)
markdownMiddleware markdown =
  markdown
    |> Markdown.Block.parse Nothing
    |> List.map (customHtmlBlock)
    |> List.concat
