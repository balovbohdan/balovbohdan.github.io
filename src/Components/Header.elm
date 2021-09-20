module Components.Header exposing (header)

import Html.Styled exposing (div, text, Html)

type alias Props = { kind: String }

primaryHeader : Html message
primaryHeader =
  div
    []
    [ text "primary" ]

secondaryHeader : Html message
secondaryHeader =
  div
    []
    [ text "secondary" ]

header : Props -> Html message
header props =
  case props.kind of
    "primary" -> primaryHeader
    "secondary" -> secondaryHeader
    _ -> primaryHeader
