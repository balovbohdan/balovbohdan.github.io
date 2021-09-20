module Utils.Css exposing (mixCss)

import Css

mixCss : List Css.Style -> List Css.Style -> List Css.Style
mixCss baseCss customCss = List.append baseCss customCss
