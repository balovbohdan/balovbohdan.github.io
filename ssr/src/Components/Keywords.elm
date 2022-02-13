module Components.Keywords exposing (keywords)

import Css
import Html.Styled exposing (a, div, text, text, Html)
import Html.Styled.Attributes exposing (css, href)

import Core.Theme exposing (Theme)

type alias Props =
  { keywords: List String
  , theme: Theme
  }

keyword : String -> Theme -> Html message
keyword word theme =
  a
    [ href ("/#/blog?keywords=" ++ word)
    , css
        [ Css.padding2 (Css.px 2) (Css.px 10)
        , Css.borderRadius <| Css.px 15
        , Css.cursor Css.pointer
        , Css.color theme.textSecondryStrong
        , Css.backgroundColor theme.backgroundSecondary
        , Css.fontSize <| Css.rem 0.8
        , Css.hover [ Css.textDecoration Css.none ]
        ]
    ]
    [ text word ]

mapKeywords : Props -> List (Html message)
mapKeywords props =
  List.map (\word -> keyword word props.theme) props.keywords

keywords : Props -> Html message
keywords props =
  div
    [ css
        [ Css.displayFlex
        , Css.flexWrap Css.wrap
        , Css.property "gap" "10px"
        ]
    ]
    (mapKeywords props)
