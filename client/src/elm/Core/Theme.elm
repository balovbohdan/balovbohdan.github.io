module Core.Theme exposing (getTheme, Theme)

import Css exposing (rgb, rgba, Color)

type alias Theme =
  { primary: Color
  , primaryLight: Color
  , primaryStrong: Color
  , secondary : Color
  , secondaryStrong: Color
  , accent : Color
  , textPrimary: Color
  , textSecondary: Color
  , textSecondryStrong: Color
  , background: Color
  , backgroundSecondary: Color
  , codeColor: Color
  , codeBackground: Color
  }

themeLight : Theme
themeLight =
  { primary = rgb 111 125 195
  , primaryLight = rgb 93 100 116
  , primaryStrong = rgb 97 112 189
  , secondary = rgb 249 249 249
  , secondaryStrong = rgb 216 212 213
  , accent = rgb 255 51 102
  , textPrimary = rgb 33 34 39
  , textSecondary = rgb 173 172 181
  , textSecondryStrong = rgb 75 83 88
  , background = rgb 255 255 255
  , backgroundSecondary = rgb 240 240 240
  , codeColor = rgba 255 255 255 0.8
  , codeBackground = rgb 33 34 39
  }

themeDark : Theme
themeDark =
  { primary = rgb 97 112 189
  , primaryLight = rgb 112 121 140
  , primaryStrong = rgb 69 85 165
  , secondary = rgb 249 249 249
  , secondaryStrong = rgb 216 212 213
  , accent = rgb 255 51 102
  , textPrimary = rgba 255 255 255 0.8
  , textSecondary = rgb 173 172 181
  , textSecondryStrong = rgb 216 212 213
  , background = rgb 33 34 39
  , backgroundSecondary = rgb 47 48 55
  , codeColor = rgb 7 160 195
  , codeBackground = rgb 4 21 31
  }

getTheme : String -> Theme
getTheme colorShema =
  case colorShema of
    "dark" -> themeDark
    "light" -> themeLight
    _ -> themeLight
