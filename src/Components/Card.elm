module Components.Card exposing (card)

import Css
import Css.Media
import Css.Transitions
import Html.Styled exposing (a, div, h3, p, text, img, Html)
import Html.Styled.Attributes exposing (css, src, href)

import Utils.Css exposing (mixCss)
import Core.Model exposing (Model)

type alias Props =
  { title: String
  , description: String
  , coverSrc: String
  , css: List Css.Style
  , to: String
  }

cover : Props -> Html message
cover props =
  div
    [ css [ Css.width (Css.pct 100) ] ]
    [ img
        [ src props.coverSrc
        , css [ Css.display Css.block, Css.maxWidth (Css.pct 100) ]
        ]
        []
    ]

footer : Model -> Props -> Html message
footer model props =
  div
    [ css [ Css.flexBasis <| Css.pct 25, Css.padding (Css.px 10) ] ]
    [ p
        [ css
            [ Css.color model.theme.textSecondary
            , Css.marginTop (Css.px 5)
            , Css.fontSize (Css.rem 1)
            ]
        ]
        [ text props.description ]
    , h3 [ css [ Css.margin (Css.px 0) ] ] [ text props.title ]
    ]

getCardCss : Model -> Props -> List Css.Style
getCardCss model props =
  mixCss
    [ Css.display Css.block
    , Css.flexBasis <| Css.pct 31.5
    , Css.cursor Css.pointer
    , Css.hover [ Css.backgroundColor model.theme.primary ]
    , Css.Transitions.transition [ Css.Transitions.backgroundColor 200 ]
    , Css.Media.withMedia
      [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth (Css.px 400) ] ]
      [ Css.flexBasis <| Css.pct 100 ]
    , Css.Media.withMedia
      [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth (Css.px 900) ] ]
      [ Css.flexBasis <| Css.pct 49 ]
    ]
    props.css

card : Model -> Props -> Html message
card model props =
  case props.to of
    "" ->
      div
        [ css (getCardCss model props) ]
        [ cover props, footer model props ]
    _ ->
      a
        [ css (getCardCss model props), href props.to ]
        [ cover props, footer model props ]
