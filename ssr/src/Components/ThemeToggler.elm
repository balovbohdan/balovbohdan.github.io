module Components.ThemeToggler exposing (themeToggler)

import Html.Styled exposing (Html)

import Core.Theme exposing (Theme)
import Components.Toggler exposing (toggler)

type alias Props message =
  { theme: Theme
  , checked: Bool
  , onCheck: Bool -> message
  }

themeToggler : Props message -> Html message
themeToggler props =
  toggler
    { theme = props.theme
    , onCheck = props.onCheck
    , checked = props.checked
    }
