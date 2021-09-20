module Core.App exposing (app)

import Core.Model exposing (Model)
import Html.Styled exposing (Html)

import Features.Home exposing (home)
import Features.Post exposing (post)

app : Model -> Html msg
app model =
  case model.url.path of
    "/" -> home model
    "/post" -> post model
    _ -> home model
