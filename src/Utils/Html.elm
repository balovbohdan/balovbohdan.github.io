module Utils.Html exposing (parseMarkdown)

import Markdown
import Html.Styled exposing (fromUnstyled, Html)
import Core.Message exposing (Message)

parseMarkdown : String -> List (Html Message)
parseMarkdown markdown =
  List.map fromUnstyled (Markdown.toHtml Nothing markdown)
