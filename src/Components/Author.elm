module Components.Author exposing (author)

import Css
import Css.Media
import Html.Styled exposing (div, p, text, Html)
import Html.Styled.Attributes exposing (css)

import Utils.Css exposing (mixCss)
import Core.Model exposing (Model)

type alias Props = { css: List Css.Style }

avatar : Model -> Html message
avatar model =
  div
    [ css
        [ Css.width (Css.px 100)
        , Css.height (Css.px 100)
        , Css.borderRadius (Css.pct 50)
        , Css.backgroundColor model.theme.secondary
        , Css.backgroundImage (Css.url "assets/avatar.jpg")
        , Css.backgroundSize Css.cover
        , Css.backgroundPosition Css.center
        , Css.Media.withMedia
            [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth (Css.px 400) ] ]
            [ Css.width <| Css.px 70, Css.height <| Css.px 70 ]
        ]
    ]
    []

sign : Html message
sign =
  div
    [ css [ Css.marginLeft (Css.px 20) ] ]
    [ p [] [ text "Software Development Blog" ]
    , p [] [ text "By Bohdan Balov" ]
    ]

author : Model -> Props -> Html message
author model props =
  div
    [ css
        (mixCss
          [ Css.displayFlex
          , Css.flexDirection Css.row
          , Css.alignItems Css.center
          ]
          props.css)
    ]
    [ avatar model, sign ]
