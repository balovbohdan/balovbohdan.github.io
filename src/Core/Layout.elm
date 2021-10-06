module Core.Layout exposing (layout)

import Css
import Css.Global
import Html.Styled exposing (div, Html)
import Html.Styled.Attributes exposing (css)

import Core.Model exposing (Model)
import Core.Message exposing (Message)
import Components.Header exposing (header)

type alias Props = { model: Model, feature: Html Message }

globalCss : Model -> Html Message
globalCss model =
  Css.Global.global
    [ Css.Global.selector "body" [ Css.backgroundColor model.theme.background ]
    , Css.Global.selector "p, a, ol, ul, li, span, h1, h2, h3, h4, h5, h6" [ Css.color model.theme.textPrimary ]
    ]

layout : Props -> Html Message
layout props =
  div
    [ css
        [ Css.padding2 Css.zero (Css.px 10)
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
    ]
