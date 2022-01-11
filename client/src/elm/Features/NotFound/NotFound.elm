module Features.NotFound.NotFound exposing (notFound)

import Css
import Json.Encode
import Html.Styled exposing (div, iframe, Html)
import Html.Styled.Attributes exposing (css, src, property)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message)

gif : Html Message
gif =
  div
    []
    [
      iframe
        [ css
            [ Css.margin2 Css.zero Css.auto
            , Css.width <| Css.px 300
            , Css.height <| Css.px 300
            , Css.maxWidth <| Css.pct 100
            ]
        , src "https://giphy.com/embed/OZeWzZalgU5XNyHAqh"
        , property "class" (Json.Encode.string "giphy-embed")
        , property "frameBorder" (Json.Encode.string "0")
        , property "allowfullscreen" (Json.Encode.string "true")
        ]
        []
    ]

notFound : Model -> Html Message
notFound model = div [] [ gif ]
