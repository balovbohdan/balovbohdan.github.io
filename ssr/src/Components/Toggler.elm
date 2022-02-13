module Components.Toggler exposing (toggler)

import Css
import Css.Transitions
import Css.Global
import Html.Styled.Events exposing (onCheck)
import Html.Styled.Attributes exposing (type_, checked)
import Html.Styled exposing (div, label, input, span, Html)
import Html.Styled.Attributes exposing (css)

import Core.Theme exposing (Theme)

type alias Props message =
  { theme: Theme
  , onCheck: Bool -> message
  , checked: Bool
  }

constants : { width: Float, height: Float }
constants = { width = 60, height = 34 }

checkboxInput : Props message -> Html message
checkboxInput props =
  input
    [ type_ "checkbox"
    , onCheck props.onCheck
    , checked props.checked
    , css
        [ Css.opacity Css.zero
        , Css.width Css.zero
        , Css.height Css.zero
        , Css.checked
            [ Css.Global.adjacentSiblings
                [ Css.Global.typeSelector "span"
                  [ Css.backgroundColor props.theme.primary
                  , Css.before [ Css.transform (Css.translateX <| Css.px 26) ]
                  ]
                ]
            ]
        , Css.focus
            [ Css.Global.adjacentSiblings
                [ Css.Global.typeSelector "span"
                    [ Css.boxShadow4 Css.zero Css.zero (Css.px 1) (Css.hex "2196F3") ]
                ]
            ]
        ]
    ]
    []

track : Props message -> Html message
track props =
  span
    [ css
        [ Css.position Css.absolute
        , Css.cursor Css.pointer
        , Css.top Css.zero
        , Css.left Css.zero
        , Css.right Css.zero
        , Css.bottom Css.zero
        , Css.borderRadius <| Css.px constants.height
        , Css.backgroundColor props.theme.secondaryStrong
        , Css.Transitions.transition [ Css.Transitions.transform 400 ]
        , Css.before
            [ Css.position Css.absolute
            , Css.property "content" "''"
            , Css.width <| Css.px 26
            , Css.height <| Css.px 26
            , Css.left <| Css.px 4
            , Css.bottom <| Css.px 4
            , Css.before [ Css.borderRadius <| Css.pct 50 ]
            , Css.backgroundColor props.theme.secondary
            , Css.Transitions.transition [ Css.Transitions.transform 400 ]
            ]
        ]
    ]
    []

toggler : Props message -> Html message
toggler props =
  div
    []
    [ label
        [ css
            [ Css.display Css.inlineBlock
            , Css.position Css.relative
            , Css.width <| Css.px constants.width
            , Css.height <| Css.px constants.height
            ]
        ]
        [ checkboxInput props, track props ]
    ]
