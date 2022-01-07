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
getOpacity model = if model.featureData.visibleUi then "1" else "0"

feature : Model -> Html Message
feature model = (getFeature <| Url.toString model.url) model

featureWithPreloader : Model -> Html Message
featureWithPreloader model =
  div
    [ css
        [ Css.property "opacity" (getOpacity model)
        , Css.Transitions.transition
            [ Css.Transitions.opacity (toFloat constants.uiOpacityTransitionDuration) ]
        ]
    ]
    [ feature model ]

app : Model -> Html Message
app model =
  layout
    { model = model
    , feature = featureWithPreloader model
    , visibleFooter = model.featureData.visibleUi
    }
