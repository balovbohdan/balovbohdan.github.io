module Features.Home.Home exposing (home)

import Css
import Html.Styled exposing (div, Html)
import Html.Styled.Attributes exposing (css)

import Components.Card exposing (card)
import Core.Model exposing (Model)
import Core.Message exposing (Message)
import Features.Home.Model exposing (parseHomeFeatureContent, Post)

-- state : State
-- state =
--   { posts =
--       [
--         { id = "1"
--         , title = "Why I decided to learn Elm and drop React"
--         , description = "About Ramda, Haskell, TypeScript, and Elm"
--         , coverSrc = "assets/avatar.jpg"
--         }
--       , { id = "2"
--         , title = "Why I decided to learn Elm and drop React"
--         , description = "About Ramda, Haskell, TypeScript, and Elm"
--         , coverSrc = "assets/avatar.jpg"
--         }
--       , { id = "3"
--         , title = "Why I decided to learn Elm and drop React"
--         , description = "About Ramda, Haskell, TypeScript, and Elm"
--         , coverSrc = "assets/avatar.jpg"
--         }
--       , { id = "4"
--         , title = "Why I decided to learn Elm and drop React"
--         , description = "About Ramda, Haskell, TypeScript, and Elm"
--         , coverSrc = "assets/avatar.jpg"
--         }
--       ]
--   }

post : Model -> Post -> Html Message
post model data =
  card
    { title = data.name
    , description = "gag description"
    , coverSrc = "https://raw.githubusercontent.com/balovbohdan/mr-balov-blog/main/dist/assets/post-cover.jpg?raw=true"
    , css = [ Css.marginBottom (Css.px 30) ]
    , to = "/post/" ++ data.name
    , theme = model.theme
    }

posts : Model -> Html Message
posts model =
  let
    postPreviews = parseHomeFeatureContent model.featureData.content
  in
    div
      [ css
          [ Css.displayFlex
          , Css.flexWrap Css.wrap
          , Css.justifyContent Css.spaceBetween
          , Css.margin2 Css.zero Css.auto
          , Css.maxWidth (Css.px 1000)
          ]
      ]
      ( List.map (post model) postPreviews )

home : Model -> Html Message
home model = posts model
