module Features.Author.Interests exposing (interests)

import Css
import Css.Transitions
import Html.Styled exposing (p, a, h3, img, div, text, Html)
import Html.Styled.Attributes exposing (css, src, href)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))
import Components.PageSection exposing (pageSection)

type alias TileProps =
  { model: Model
  , title: String
  , description: String
  , href: String
  , iconSrc: String
  }

tileHeader : TileProps -> Html Message
tileHeader props =
  div
    [ css [ Css.displayFlex, Css.alignItems Css.center ] ]
    [ img
        [ src props.iconSrc
        , css [ Css.width <| Css.px 30, Css.height <| Css.px 30 ]
        ]
        []
    , h3
        [ css
            [ Css.margin Css.zero
            , Css.marginLeft <| Css.px 20
            , Css.color props.model.theme.textSecondary
            ]
        ]
        [ text props.title ]
    ]

tile : TileProps -> Html Message
tile props =
  div
    [ css
        [ Css.displayFlex
        , Css.flexDirection Css.column
        , Css.justifyContent Css.spaceBetween
        , Css.height <| Css.px 250
        , Css.padding <| Css.px 15
        , Css.backgroundColor props.model.theme.backgroundSecondary
        ]
    ]
    [ div
        []
        [ tileHeader props
        , p
            [ css [ Css.color props.model.theme.textPrimary ] ]
            [ text props.description ]
        ]
    , a
        [ href props.href
        , css
            [ Css.textDecoration Css.underline
            , Css.color props.model.theme.textPrimary
            , Css.hover [ Css.color props.model.theme.textSecondary ]
            , Css.Transitions.transition [ Css.Transitions.color 100 ]
            ]
        ]
        [ text "Explore" ]
    ]

tiles : Model -> Html Message
tiles model =
  div
    [ css
        [ Css.property "display" "grid"
        , Css.property "gap" "30px"
        , Css.property "grid-template-columns" "repeat(auto-fit, minmax(300px, 1fr))"
        ]
    ]
    [ tile
        { model = model
        , title = "React"
        , description = "This is my everyday tool."
        , iconSrc = "/assets/react.svg"
        , href = "/"
        }
    , tile
        { model = model
        , title = "TypeScript"
        , description = "I believe this is the best lang for business apps development. And a good one for applied FP."
        , iconSrc = "/assets/typescript.svg"
        , href = "/"
        }
    , tile
        { model = model
        , title = "Elm"
        , description = "I started exploring this tech just for fun! And I'm still not sure this is a good production lang."
        , iconSrc = "/assets/elm.svg"
        , href = "/#/posts/why-i-decided-to-drop-react"
        }
    , tile
        { model = model
        , title = "Functional Programming"
        , description = "As for me, FP is a good thing for developing reliable apps."
        , iconSrc = "/assets/cpu.svg"
        , href = "/#/posts/fp-notes-purity-1"
        }
    , tile
        { model = model
        , title = "Haskell"
        , description = "I'm not a professional. But this lang looks interesting for me from an experiments perspective."
        , iconSrc = "/assets/haskell.svg"
        , href = "/"
        }
    , tile
        { model = model
        , title = "Writing"
        , description = "I like reading and writing. Even tried myself at writing a novel! ✍️"
        , iconSrc = "/assets/typewriter.svg"
        , href = "https://medium.com/@balovbohdan"
        }
    , tile
        { model = model
        , title = "Aeromodeling"
        , description = "This is my passion. But it is currently on pause because of Software Engineer career."
        , iconSrc = "/assets/plane.svg"
        , href = "/#/aeromodeling"
        }
    ]

interests : Model -> Html Message
interests model =
  pageSection
    { model = model
    , title = "Interests"
    , body = tiles model
    , footer = Nothing
    }
