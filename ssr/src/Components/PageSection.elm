module Components.PageSection exposing (pageSection)

import Css
import Html.Styled.Attributes exposing (css)
import Html.Styled exposing (h2, div, text, Html)

import Core.Theme exposing (Theme)

type alias Props message =
  { theme: Theme
  , title: String
  , body: Html message
  , footer: Maybe (Html message)
  }

header : Props message -> Html message
header props =
  h2
    [ css [ Css.marginBottom <| Css.px 50 ] ]
    [ text props.title ]

footer : Props message -> Html message
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

pageSection : Props message -> Html message
pageSection props =
  div
    [ css [ Css.color props.theme.textPrimary, Css.marginTop <| Css.px 70 ] ]
    [ header props, props.body, footer props ]
