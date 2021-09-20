module Core.Theme exposing (getTheme, Theme)

import Css exposing (rgb, Color)

type alias Theme =
  { primary : Color
  , secondary : Color
  , textPrimary: Color
  , textSecondary: Color
  }

themeLight : Theme
themeLight =
  { primary = rgb 97 112 189
  , secondary = rgb 249 249 249
  , textPrimary = rgb 33 34 39
  , textSecondary = rgb 173 172 181
  }

themeDark : Theme
themeDark =
  { primary = rgb 97 112 189
  , secondary = rgb 249 249 249
  , textPrimary = rgb 33 34 39
  , textSecondary = rgb 173 172 181
  }

getTheme : String -> Theme
getTheme colorScheme =
  case colorScheme of
    "dark" -> themeDark
    "light" -> themeLight
    _ -> themeLight
