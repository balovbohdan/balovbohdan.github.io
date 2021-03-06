module Features.Home.Author exposing (author)

import Css
import Html.Styled.Attributes exposing (css)
import Html.Styled exposing (p, text, Html)

import Components.Button exposing (button)
import Components.Introduction exposing (introduction)
import Components.PageSection exposing (pageSection)
import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))

exploreMoreButton : Model -> Html Message
exploreMoreButton model =
  button
    { text = "Explore more"
    , model = model
    , to = Just "/#/author"
    , onClick = Nothing
    }

description : List (Html Message)
description =
  [ p
      [ css [ Css.marginTop Css.zero ] ]
      [ text "Hello! I'm Mr. Balov. And this is my humble blog about Software Development. What you can find here?" ]
  , p [] [ text "Firstly, thoughts about exotic techs. Such as Elm or ClosureScript. E.g., I'm developing this blog with Elm. And it gives me an experience I want to document." ]
  , p [] [ text "Secondly, thoughts and recipes about mainstream techs. Such as React and TypeScript. I like React, and it is my main tool for everyday stuff. And TypeScript is a good addon to it." ]
  , p [] [ text "Thirdly, some notes about different topics around Software Development. E.g., I'm interested in mentoring and team-leading. And my notes may be useful for everyone who wants to grow to Senior level and higher." ]
  , p
      [ css [ Css.marginBottom Css.zero ] ]
      [ text "So, stay connected! I hope, this will be useful for you. And for me, of course! 🤓" ]
  ]

body : Model -> Html Message
body model =
  introduction
    { model = model
    , pictureUrl = "/assets/author-1.jpg"
    , description = description
    }

author : Model -> Html Message
author model =
  pageSection
    { model = model
    , title = "About author"
    , body = body model
    , footer = Just (exploreMoreButton model)
    }
