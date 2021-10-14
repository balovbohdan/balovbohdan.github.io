module Features.NotFound.NotFound exposing (notFound)

import Html.Styled exposing (div, text, Html)

import Core.Model exposing (Model)
import Core.Message exposing (Message)

notFound : Model -> Html Message
notFound _ =
  div [] [ text "not found" ]
