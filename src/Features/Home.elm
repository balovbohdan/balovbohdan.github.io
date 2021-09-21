module Features.Home exposing (home)

import Css
import Html.Styled exposing (div, Html)
import Html.Styled.Attributes exposing (css)

import Components.Author exposing (author)
import Components.Card exposing (card)
import Components.Header exposing (header)
import Core.Model exposing (Model)
import Core.Message exposing (Message)

type alias Post =
  { id: String
  , title: String
  , description: String
  , coverSrc: String
  }

type alias State = { posts: List Post }

state : State
state =
  { posts =
      [
        { id = "1"
        , title = "Why I decided to learn Elm and drop React"
        , description = "About Ramda, Haskell, TypeScript, and Elm"
        , coverSrc = "assets/avatar.jpg"
        }
      , { id = "2"
        , title = "Why I decided to learn Elm and drop React"
        , description = "About Ramda, Haskell, TypeScript, and Elm"
        , coverSrc = "assets/avatar.jpg"
        }
      , { id = "3"
        , title = "Why I decided to learn Elm and drop React"
        , description = "About Ramda, Haskell, TypeScript, and Elm"
        , coverSrc = "assets/avatar.jpg"
        }
      , { id = "4"
        , title = "Why I decided to learn Elm and drop React"
        , description = "About Ramda, Haskell, TypeScript, and Elm"
        , coverSrc = "assets/avatar.jpg"
        }
      ]
  }

post : Model -> Post -> Html Message
post model data =
  card
    { title = data.title
    , description = data.description
    , coverSrc = data.coverSrc
    , css = [ Css.marginBottom (Css.px 30) ]
    , to = "/post/" ++ data.id
    , model = model
    }

posts : Model -> Html Message
posts model =
  div
    [ css
        [ Css.displayFlex
        , Css.flexWrap Css.wrap
        , Css.justifyContent Css.spaceBetween
        , Css.margin2 Css.zero Css.auto
        , Css.maxWidth (Css.px 1000)
        ]
    ]
    (List.map (post model) state.posts)

about : Model -> Html Message
about model =
  div
    [ css
        [ Css.displayFlex
        , Css.justifyContent Css.center
        , Css.margin2 (Css.px 50) Css.zero
        ]
    ]
    [ author { model = model, css = [] } ]

home : Model -> Html Message
home model =
  div
    [ css [ Css.margin2 Css.zero (Css.px 10) ] ]
    [ header { model = model }, about model, posts model ]
