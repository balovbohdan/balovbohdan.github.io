module Core.App exposing (app)

import Url
import Html.Styled exposing (p, Html)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message)
import Core.Route.Utils exposing (getFeature)
import Core.Layout exposing (layout)

feature : Model -> Html Message
feature model = (getFeature <| Url.toString model.url) model

app : Model -> Html Message
app model = layout { model = model, feature = feature model }
