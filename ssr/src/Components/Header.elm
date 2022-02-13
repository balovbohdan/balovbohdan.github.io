module Components.Header exposing (header)

import Css
import Css.Media
import Html.Styled exposing (div, Html)
import Html.Styled.Attributes exposing (css)

import Core.Theme exposing (Theme)
import Utils.Css exposing (mixCss)
import Components.Author exposing (author)
import Components.ThemeToggler exposing (themeToggler)

type alias Props message =
  { theme: Theme
  , colorSchema: String
  , avatarHref: String
  , css: List Css.Style
  , onThemeToggle: Bool -> message
  }

getHeaderCss : Props message -> List Css.Style
getHeaderCss props =
  mixCss
    [ Css.displayFlex
    , Css.property "gap" "10px"
    , Css.justifyContent Css.spaceBetween
    , Css.alignItems Css.center
    , Css.padding2 (Css.px 10) Css.zero
    , Css.Media.withMedia
        [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth <| Css.px 400 ] ]
        [ Css.justifyContent Css.center ]
    ]
    props.css

header : Props message -> Html message
header props =
  div
    [ css (getHeaderCss props) ]
    [ author
        { theme = props.theme
        , avatarHref = props.avatarHref
        , css = []
        }
    , themeToggler
        { theme = props.theme
        , checked = props.colorSchema == "dark"
        , onCheck = props.onThemeToggle
        }
    ]
