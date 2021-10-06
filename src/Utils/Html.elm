module Utils.Html exposing (parseHtmlString)

import Html.Parser
import Html.Parser.Util
import Html.Styled exposing (fromUnstyled, Html)
import Core.Message exposing (Message)

parseHtmlString : String -> List (Html Message)
parseHtmlString content =
  case Html.Parser.run content of
    Ok nodes -> List.map fromUnstyled (Html.Parser.Util.toVirtualDom nodes)
    Err _ -> []
