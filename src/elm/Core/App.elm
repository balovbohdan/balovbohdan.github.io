module Core.App exposing (app)

import Url
import Css
import Css.Transitions
import Html.Styled exposing (div, Html)
import Html.Styled.Attributes exposing (css)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message)
import Core.Route.Utils exposing (getFeature)
import Core.Layout exposing (layout)
import Core.Constants exposing (constants)

getOpacity : Model -> String
getOpacity model = if model.featureData.shouldShowUi then "1" else "0"

feature : Model -> Html Message
feature model = (getFeature <| Url.toString model.url) model

app : Model -> Html Message
app model =
  div
    [ css
        [ Css.property "opacity" (getOpacity model)
        , Css.Transitions.transition [ Css.Transitions.opacity (toFloat constants.uiOpacityTransitionDuration) ]
        ]
    ]
    [ layout { model = model, feature = feature model } ]
