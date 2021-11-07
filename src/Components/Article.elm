module Components.Article exposing (article)

import Css
import Css.Global
import Html.Styled exposing (div, Html)
import Html.Styled.Attributes exposing (css)

import Core.Model exposing (Model)
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
            [ Css.Global.typeSelector "p img" [ Css.margin2 Css.zero Css.auto, Css.height <| Css.px 550 ]
            , Css.Global.typeSelector "p a" [ Css.color props.model.theme.accent ]
            ]
        ]
    ]
    (parseMarkdown props.content)
