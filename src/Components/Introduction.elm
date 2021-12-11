module Components.Introduction exposing (introduction)

import Css
import Css.Media
import Html.Styled exposing (div, Html)
import Html.Styled.Attributes exposing (css)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))

type alias Props =
  { model: Model
  , pictureUrl: String
  , description: List (Html Message)
  }

picture : Props -> Html Message
picture props =
  div
    [ css
        [ Css.flexBasis <| Css.pct 50
        , Css.backgroundColor props.model.theme.primaryLight
        , Css.backgroundImage (Css.url props.pictureUrl)
        , Css.backgroundSize Css.cover
        , Css.backgroundPosition Css.top
        , Css.Media.withMedia
            [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth <| Css.px 600 ] ]
            [ Css.flexBasis <| Css.pct 100, Css.height <| Css.vh 70 ]
        ]
    ]
    []

description : Props -> Html Message
description props =
  div
    [ css
        [ Css.flexBasis <| Css.pct 50
        , Css.Media.withMedia
            [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth <| Css.px 600 ] ]
            [ Css.flexBasis <| Css.pct 100 ]
        ]
    ]
    props.description

introduction : Props -> Html Message
introduction props =
  div
    [ css
        [ Css.displayFlex
        , Css.property "gap" "20px"
        , Css.Media.withMedia
          [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth <| Css.px 600 ] ]
          [ Css.flexWrap Css.wrap ]
        ]
    ]
    [ picture props, description props ]
