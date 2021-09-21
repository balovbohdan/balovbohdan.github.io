module Core.Theme exposing (getTheme, Theme)

import Css exposing (rgb, Color)

type alias Theme =
  { primary : Color
  , secondary : Color
  , secondaryStrong: Color
  , accent : Color
  , textPrimary: Color
  , textSecondary: Color
  , backgroundColor: Color
  }

themeLight : Theme
themeLight =
  { primary = rgb 97 112 189
  , secondary = rgb 249 249 249
  , secondaryStrong = rgb 216 212 213
  , accent = rgb 255 51 102
  , textPrimary = rgb 33 34 39
  , textSecondary = rgb 173 172 181
  , backgroundColor = rgb 255 255 255
  }

themeDark : Theme
themeDark =
  { primary = rgb 97 112 189
  , secondary = rgb 249 249 249
  , secondaryStrong = rgb 216 212 213
  , accent = rgb 255 51 102
  , textPrimary = rgb 247 247 242
  , textSecondary = rgb 173 172 181
  , backgroundColor = rgb 33 34 39
  }

getTheme : String -> Theme
getTheme colorShema =
  case colorShema of
    "dark" -> themeDark
    "light" -> themeLight
    _ -> themeLight
