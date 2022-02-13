module Utils.Markdown.Markdown exposing (parseMarkdown)

import Html.Styled exposing (fromUnstyled, Html)

import Utils.Markdown.CustomParser exposing (parseWithCustomElements)

parseMarkdown : String -> List (Html message)
parseMarkdown markdown =
  List.map fromUnstyled (parseWithCustomElements markdown)
