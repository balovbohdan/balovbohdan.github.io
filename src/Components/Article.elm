module Components.Article exposing (article)

import Css
import Css.Global
import Html.Styled exposing (div, Html)
import Html.Styled.Attributes exposing (css)

import Core.Model exposing (Model)
import Core.Message exposing (Message)
import Utils.Html exposing (parseHtmlString)

type alias Props = { model: Model, content: String }

article : Props -> Html Message
article props =
  div
    [ css
        [ Css.maxWidth <| Css.px 750
        , Css.margin2 Css.zero Css.auto
        , Css.Global.children
            [ Css.Global.typeSelector "img" [ Css.margin2 Css.zero Css.auto ]
            , Css.Global.class "caption"
              [ Css.display Css.inlineBlock
              , Css.width <| Css.pct 100
              , Css.color props.model.theme.textSecondryStrong
              , Css.fontSize <| Css.rem 0.8
              , Css.textAlign Css.center
              , Css.textDecoration Css.underline
              ]
            ]
        ]
    ]
    (parseHtmlString props.content)
