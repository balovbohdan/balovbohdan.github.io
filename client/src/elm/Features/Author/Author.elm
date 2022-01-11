module Features.Author.Author exposing (author)

import Html.Styled exposing (div, Html)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))
import Features.Author.Bio exposing (bio)
import Features.Author.Interests exposing (interests)

author : Model -> Html Message
author model =
  div [] [ bio model, interests model ]
