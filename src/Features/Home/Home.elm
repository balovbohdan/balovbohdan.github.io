module Features.Home.Home exposing (home)

import Html.Styled exposing (div, Html)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))
import Features.Home.Author exposing (author)
import Features.Home.Posts exposing (posts)

home : Model -> Html Message
home model =
  div [] [ posts model, author model ]
