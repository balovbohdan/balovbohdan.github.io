module Components.Header exposing (header)

import Css
import Css.Media
import Html.Styled exposing (div, Html)
import Html.Styled.Attributes exposing (css)

import Core.Message exposing (Message)
import Core.Model exposing (Model)
import Components.ThemeToggler exposing (themeToggler)

type alias Props = { model: Model }

header : Props -> Html Message
header props =
  div
    [ css
        [ Css.displayFlex
        , Css.justifyContent Css.end
        , Css.padding2 (Css.px 10) Css.zero
        , Css.Media.withMedia
            [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth <| Css.px 400 ] ]
            [ Css.justifyContent Css.center ]
        ]
    ]
    [ themeToggler { model = props.model } ]
