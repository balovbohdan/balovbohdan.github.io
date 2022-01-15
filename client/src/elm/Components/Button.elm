module Components.Button exposing (button)

import Css
import Css.Transitions
import Html.Styled exposing (div, a, text, Html, Attribute)
import Html.Styled.Attributes exposing (css, href)
import Html.Styled.Events exposing (onClick)
import Core.Model.Types exposing (Model)
import Core.Message exposing (Message)

type alias Props =
  { text: String
  , onClick: Maybe Message
  , to: Maybe String
  , model: Model
  }

getCss : Props -> Attribute message
getCss props =
  css
    [ Css.display Css.inlineBlock
    , Css.padding2 (Css.px 15) (Css.px 20)
    , Css.borderRadius <| Css.px 3
    , Css.cursor Css.pointer
    , Css.backgroundColor props.model.theme.primary
    , Css.color props.model.theme.textPrimary
    , Css.Transitions.transition [ Css.Transitions.backgroundColor 200 ]
    , Css.hover
        [ Css.backgroundColor props.model.theme.primaryStrong
        , Css.textDecoration Css.none
        ]
    ]

linkButton : Props -> String -> Html Message
linkButton props to =
  a
    [ getCss props, href to ]
    [ text props.text ]

regularButton : Props -> Html Message
regularButton props =
  case (props.onClick) of
    Just onClickHandler ->
      div [ getCss props, onClick onClickHandler ] [ text props.text ]
    Nothing ->
      div [ getCss props ] [ text props.text ]

button : Props -> Html Message
button props =
  case (props.to) of
    Just to ->
      linkButton props to
    Nothing ->
      regularButton props
