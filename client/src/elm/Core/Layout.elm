module Core.Layout exposing (layout)

import Css
import Css.Global
import Css.Transitions
import Html.Styled exposing (a, div, img, span, text, Html)
import Html.Styled.Attributes exposing (css, src, href, title)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message)
import Components.Header exposing (header)

type alias Props = { model: Model, feature: Html Message, visibleFooter: Bool }

globalCss : Model -> Html Message
globalCss model =
  Css.Global.global
    [ Css.Global.selector "body" [ Css.backgroundColor model.theme.background ]
    , Css.Global.selector "p, a, ol, ul, li, span, h1, h2, h3, h4, h5, h6" [ Css.color model.theme.textPrimary ]
    ]

socialButton : Model -> String -> String -> String -> Html Message
socialButton model name socialHref imageUrl =
  a
    [ title name
    , href socialHref
    , css
        [ Css.padding <| Css.px 3
        , Css.borderRadius <| Css.px 5
        , Css.hover [ Css.backgroundColor model.theme.secondaryStrong ]
        , Css.Transitions.transition [ Css.Transitions.backgroundColor 200 ]
        ]
    ]
    [ img
        [ src imageUrl
        , css [ Css.height <| Css.px 30 ]
        ]
        []
    ]

footer : Model -> Html Message
footer model =
  div
    [ css
        [ Css.displayFlex
        , Css.alignItems Css.center
        , Css.justifyContent Css.spaceBetween
        , Css.height <| Css.px 100
        , Css.marginTop <| Css.px 100
        , Css.borderTop3 (Css.px 1) Css.solid model.theme.primaryLight
        ]
    ]
    [ span [ css [ Css.color model.theme.primaryLight ] ] [ text "All rights reserved" ]
    , div
        [ css [ Css.displayFlex, Css.property "gap" "10px" ] ]
        [ socialButton
            model
            "GitHub"
            "https://github.com/balovbohdan"
            "/assets/github.svg"
        , socialButton
            model
            "Twitter"
            "https://twitter.com/balov_bohdan"
            "/assets/twitter.svg"
        , socialButton
            model
            "Medium"
            "https://medium.com/@balovbohdan"
            "/assets/medium.svg"
        ]
    ]

layout : Props -> Html Message
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
    [ globalCss props.model
    , header
        { model = props.model
        , avatarHref = "/"
        , css = [ Css.marginTop <| Css.px 50 ]
        }
    , div [ css [ Css.marginTop <| Css.px 50 ] ] [ props.feature ]
    , if props.visibleFooter then footer props.model else div [] []
    ]
