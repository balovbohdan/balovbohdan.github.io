module Components.Button exposing (button)

import Css
import Html.Styled exposing (div, text, Html)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Core.Model.Types exposing (Model)
import Core.Message exposing (Message)

type alias Props = { text: String, onClick: Message, model: Model }

button : Props -> Html Message
button props =
  div
    [ onClick props.onClick
    , css
        [ Css.display Css.inlineBlock
        , Css.padding2 (Css.px 15) (Css.px 20)
        , Css.borderRadius <| Css.px 3
        , Css.cursor Css.pointer
        , Css.backgroundColor props.model.theme.primary
        , Css.color props.model.theme.textPrimary
        ]
    ]
    [ text props.text ]
