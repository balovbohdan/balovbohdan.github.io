module Features.Post exposing (post)

import Html.Styled exposing (div, text, Html)

import Core.Model exposing (Model)

post : Model -> Html message
post model =
  div
    []
    [ text "post" ]
