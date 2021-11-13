module Components.Article exposing (article)

import Css
import Css.Global
import Html.Styled exposing (div, Html)
import Html.Styled.Attributes exposing (css)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message)
import Utils.Html exposing (parseMarkdown)

type alias Props = { model: Model, content: String }

article : Props -> Html Message
article props =
  div
    [ css
        [ Css.maxWidth <| Css.px 750
        , Css.margin2 Css.zero Css.auto
        , Css.Global.children
            [ Css.Global.typeSelector "p a" [ Css.color props.model.theme.accent ]
            , Css.Global.typeSelector "p img"
              [ Css.margin2 Css.zero Css.auto
              , Css.maxWidth <| Css.pct 100
              , Css.height Css.auto
              ]
            , Css.Global.typeSelector "p center"
              [ Css.color props.model.theme.textPrimary
              , Css.fontSize <| Css.rem 0.8
              ]
            ]
        ]
    ]
    (parseMarkdown props.content)
