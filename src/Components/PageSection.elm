module Components.PageSection exposing (pageSection)

import Css
import Html.Styled.Attributes exposing (css)
import Html.Styled exposing (h2, div, text, Html)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))

type alias Props =
  { model: Model
  , title: String
  , body: Html Message
  , footer: Maybe (Html Message)
  }

header : Props -> Html Message
header props =
  h2
    [ css [ Css.marginBottom <| Css.px 50 ] ]
    [ text props.title ]

footer : Props -> Html Message
footer props =
  case (props.footer) of
    Nothing -> div [] []
    Just html ->
      div
        [ css
            [ Css.displayFlex
            , Css.justifyContent Css.center
            , Css.marginTop <| Css.px 70
            ]
        ]
        [ html ]

pageSection : Props -> Html Message
pageSection props =
  div
    [ css [ Css.color props.model.theme.textPrimary, Css.marginTop <| Css.px 70 ] ]
    [ header props, props.body, footer props ]
