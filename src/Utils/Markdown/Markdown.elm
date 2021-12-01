module Utils.Markdown.Markdown exposing (parseMarkdown)

import Markdown
import Html.Styled exposing (fromUnstyled, Html)

import Core.Message exposing (Message)
import Utils.Markdown.Middleware exposing (markdownMiddleware)

parseMarkdown : String -> List (Html Message)
parseMarkdown markdown =
  List.map fromUnstyled (markdownMiddleware markdown)
  -- List.map fromUnstyled (Markdown.toHtml Nothing markdown)
