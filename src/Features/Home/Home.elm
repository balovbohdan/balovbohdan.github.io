module Features.Home.Home exposing (home)

import Css
import Html.Styled exposing (div, Html)
import Html.Styled.Attributes exposing (css)

import Components.Card exposing (card)
import Core.Model exposing (Model)
import Core.Message exposing (Message)
import Features.Home.Model exposing (parseHomeFeatureContent, Post)

post : Model -> Post -> Html Message
post model content =
  card
    { title = content.name
    , description = "gag description"
    , coverSrc = "https://raw.githubusercontent.com/balovbohdan/mr-balov-blog/main/docs/assets/post-cover.jpg?raw=true"
    , css = [ Css.marginBottom (Css.px 30) ]
    , to = "/post/" ++ (String.replace ".md" "" content.name)
    , theme = model.theme
    }

posts : Model -> Html Message
posts model =
  let
    content = parseHomeFeatureContent model.featureData.content
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
      ( List.map (post model) content )

home : Model -> Html Message
home model = posts model
