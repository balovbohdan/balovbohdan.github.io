module Utils.Markdown.Markdown exposing (parseMarkdown)

import Html.Styled exposing (fromUnstyled, Html)

import Core.Message exposing (Message)
import Utils.Markdown.CustomParser exposing (parseWithCustomElements)

parseMarkdown : String -> List (Html Message)
parseMarkdown markdown =
  List.map fromUnstyled (parseWithCustomElements markdown)
