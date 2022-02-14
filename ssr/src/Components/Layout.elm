module Components.Layout exposing (layout)

import Css
import Css.Global
import Css.Transitions
import Html.Styled exposing (a, div, img, span, text, Html)
import Html.Styled.Attributes exposing (css, src, href, title)

import Core.Theme exposing (Theme)
import Components.Header exposing (header)

type alias Props message =
  { theme: Theme
  , colorSchema: String
  , feature: Html message
  , visibleFooter: Bool
  , onThemeToggle: Bool -> message
  }

globalCss : Theme -> Html message
globalCss theme =
  Css.Global.global
    [ Css.Global.selector "body" [ Css.backgroundColor theme.background ]
    , Css.Global.selector "p, a, ol, ul, li, span, h1, h2, h3, h4, h5, h6" [ Css.color theme.textPrimary ]
    ]

socialButton : Theme -> String -> String -> String -> Html message
socialButton theme name socialHref imageUrl =
  a
    [ title name
    , href socialHref
    , css
        [ Css.padding <| Css.px 3
        , Css.borderRadius <| Css.px 5
        , Css.hover [ Css.backgroundColor theme.secondaryStrong ]
        , Css.Transitions.transition [ Css.Transitions.backgroundColor 200 ]
        ]
    ]
    [ img
        [ src imageUrl
        , css [ Css.height <| Css.px 30 ]
        ]
        []
    ]

footer : Props message -> Html message
footer props =
  div
    [ css
        [ Css.displayFlex
        , Css.property "gap" "10px"
        , Css.alignItems Css.center
        , Css.justifyContent Css.spaceBetween
        , Css.height <| Css.px 100
        , Css.marginTop <| Css.px 100
        , Css.borderTop3 (Css.px 1) Css.solid props.theme.primaryLight
        ]
    ]
    [ div
        [ css
            [ Css.displayFlex
            , Css.flexWrap Css.wrap
            , Css.property "gap" "10px"
            ]
        ]
        [ span
            [ css [ Css.color props.theme.primaryLight ] ]
            [ text "All rights reserved" ]
        , span
            [ css [ Css.color props.theme.primaryLight ] ]
            [ text "© Bohdan Balov 2022" ]
        ]
    , div
        [ css [ Css.displayFlex, Css.property "gap" "10px" ] ]
        [ socialButton
            props.theme
            "GitHub"
            "https://github.com/balovbohdan"
            "/assets/github.svg"
        , socialButton
            props.theme
            "Twitter"
            "https://twitter.com/balov_bohdan"
            "/assets/twitter.svg"
        , socialButton
            props.theme
            "Medium"
            "https://medium.com/@balovbohdan"
            "/assets/medium.svg"
        ]
    ]

layout : Props message -> Html message
layout props =
  div
    [ css
        [ Css.displayFlex
        , Css.flexDirection Css.column
        , Css.justifyContent Css.spaceBetween
        , Css.padding2 Css.zero (Css.px 10)
        , Css.minHeight <| Css.vh 100
        , Css.maxWidth <| Css.px 1000
        , Css.margin2 Css.zero Css.auto
        ]
    ]
    [ globalCss props.theme
    , header
        { theme = props.theme
        , colorSchema = props.colorSchema
        , avatarHref = "/"
        , css = [ Css.marginTop <| Css.px 50 ]
        , onThemeToggle = props.onThemeToggle
        }
    , div [ css [ Css.marginTop <| Css.px 50 ] ] [ props.feature ]
    , if props.visibleFooter then footer props else div [] []
    ]
