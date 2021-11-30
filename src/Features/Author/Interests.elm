module Features.Author.Interests exposing (interests)

import Css
import Json.Encode
import Html.Styled exposing (p, div, text, iframe, Html)
import Html.Styled.Attributes exposing (css, src, property)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))
import Components.PageSection exposing (pageSection)

tile : Model -> Html Message
tile model =
  div
    [ css
        [ Css.backgroundColor model.theme.accent ]
    ]
    [ div
        [ css
            [ Css.width <| Css.px 200
            , Css.height <| Css.px 100
            , Css.backgroundColor model.theme.accent
            , Css.backgroundImage (Css.url "/assets/coding-1.gif")
            , Css.backgroundSize Css.cover
            ]
        ]
        []
    ]

tiles : Model -> Html Message
tiles model =
  div
    [ css
        [ Css.property "display" "grid"
        , Css.property "gap" "10px"
        , Css.property "grid-template-columns" "repeat(auto-fit, minmax(250px, 1fr))"
        ]
    ]
    [ tile model, tile model, tile model, tile model ]

interests : Model -> Html Message
interests model =
  pageSection
    { model = model
    , title = "Interests"
    , body = tiles model
    , footer = Nothing
    }
