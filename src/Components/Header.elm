module Components.Header exposing (header)

import Css
import Css.Media
import Html.Styled exposing (div, Html)
import Html.Styled.Attributes exposing (css)

import Utils.Css exposing (mixCss)
import Core.Message exposing (Message)
import Core.Model.Types exposing (Model)
import Components.Author exposing (author)
import Components.ThemeToggler exposing (themeToggler)

type alias Props = { model: Model, avatarHref: String, css: List Css.Style }

getHeaderCss : Props -> List Css.Style
getHeaderCss props =
  mixCss
    [ Css.displayFlex
    , Css.justifyContent Css.spaceBetween
    , Css.alignItems Css.center
    , Css.padding2 (Css.px 10) Css.zero
    , Css.Media.withMedia
        [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth <| Css.px 400 ] ]
        [ Css.justifyContent Css.center ]
    ]
    props.css

header : Props -> Html Message
header props =
  div
    [ css (getHeaderCss props) ]
    [ author
        { model = props.model
        , avatarHref = props.avatarHref
        , css = []
        }
    , themeToggler
        { model = props.model
        , checked = props.model.colorSchema == "dark"
        }
    ]
