module Core.App exposing (app)

import Css
import Css.Global
import Url
import Core.Model exposing (Model)
import Html.Styled exposing (div, Html)

import Core.Message exposing (Message)
import Core.Utils.Route exposing (getFeature)

feature : Model -> Html Message
feature model = (getFeature <| Url.toString model.url) model

globalCss : Model -> Html Message
globalCss model =
  Css.Global.global
    [ Css.Global.selector "body" [ Css.backgroundColor model.theme.backgroundColor ]
    , Css.Global.selector "p, span, h1, h2, h3, h4, h5, h6" [ Css.color model.theme.textPrimary ]
    ]

app : Model -> Html Message
app model = div [] [ globalCss model, feature model ]
