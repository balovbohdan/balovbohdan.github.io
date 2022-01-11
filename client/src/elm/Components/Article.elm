module Components.Article exposing (article)

import Css
import Css.Global
import Html.Styled exposing (div, Html)
import Html.Styled.Attributes exposing (css)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message)
import Utils.Markdown.Markdown exposing (parseMarkdown)

type alias Props = { model: Model, content: String, meta: Html Message }

content : Props -> Html Message
content props =
  div
    [ css
        [ Css.borderBottom3 (Css.px 1) Css.solid props.model.theme.primary
        , Css.marginBottom <| Css.px 15
        , Css.Global.children
            [ Css.Global.typeSelector "p a, ul a" [ Css.color props.model.theme.accent ]
            , Css.Global.typeSelector "pre" [ Css.width <| Css.pct 100 ]
            , Css.Global.typeSelector "p strong, blockquote p strong" [ Css.color props.model.theme.textPrimary ]
            , Css.Global.typeSelector "blockquote"
              [ Css.color props.model.theme.textPrimary
              , Css.paddingLeft (Css.px <| 10)
              , Css.borderLeft3 (Css.px <| 2) Css.solid props.model.theme.accent
              ]
            , Css.Global.typeSelector "p code, ul code"
              [ Css.color props.model.theme.codeColor
              , Css.backgroundColor props.model.theme.codeBackground
              , Css.padding2 Css.zero (Css.px <| 5)
              ]
            , Css.Global.typeSelector "pre code"
              [ Css.color props.model.theme.codeColor
              , Css.backgroundColor props.model.theme.codeBackground
              , Css.padding <| Css.px 15
              , Css.width <| Css.pct 100
              ]
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

article : Props -> Html Message
article props =
  div
    [ css
        [ Css.maxWidth <| Css.px 750
        , Css.margin2 Css.zero Css.auto
        ]
    ]
    [ content props, props.meta ]
