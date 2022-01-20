module Components.Keywords exposing (keywords)

import Css
import Html.Styled exposing (a, div, text, text, Html)
import Html.Styled.Attributes exposing (css, href)

import Core.Message exposing (Message)
import Core.Theme exposing (Theme)
import Core.Model.Types exposing (Model)

type alias Props =
  { keywords: List String
  , model: Model
  }

keyword : String -> Theme -> Html Message
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

mapKeywords : Props -> List (Html Message)
mapKeywords props =
  List.map (\word -> keyword word props.model.theme) props.keywords

keywords : Props -> Html Message
keywords props =
  div
    [ css
        [ Css.displayFlex
        , Css.flexWrap Css.wrap
        , Css.property "gap" "10px"
        ]
    ]
    (mapKeywords props)
