module Features.Home.AuthorAbout exposing (authorAbout)

import Css
import Css.Media
import Browser
import Html.Styled.Attributes exposing (css)
import Html.Styled exposing (p, h2, div, text, Html)

import Components.Button exposing (button)
import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))

exploreMoreButton : Model -> Html Message
exploreMoreButton model =
  button
    { text = "Explore more"
    , model = model
    , onClick = MessageLinkClicked (Browser.External "/#/blog")
    }

header : Html Message
header = h2 [ css [ Css.marginBottom <| Css.px 50 ] ] [ text "About author" ]

footer : Model -> Html Message
footer model =
  div
    [ css
        [ Css.displayFlex
        , Css.justifyContent Css.center
        , Css.marginTop <| Css.px 70
        ]
    ]
    [ exploreMoreButton model ]

picture : Model -> Html Message
picture model =
  div
    [ css
        [ Css.flexBasis <| Css.pct 50
        , Css.backgroundColor model.theme.primaryLight
        , Css.backgroundImage (Css.url "/assets/author-1.jpg")
        , Css.backgroundSize Css.cover
        , Css.backgroundPosition Css.top
        , Css.Media.withMedia
            [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth <| Css.px 600 ] ]
            [ Css.flexBasis <| Css.pct 100, Css.height <| Css.vh 70 ]
        ]
    ]
    []

description : Html Message
description =
  div
    [ css
        [ Css.flexBasis <| Css.pct 50
        , Css.Media.withMedia
            [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth <| Css.px 600 ] ]
            [ Css.flexBasis <| Css.pct 100 ]
        ]
    ]
    [ p [ css [ Css.marginTop Css.zero ] ] [ text "Hello! I'm Mr. Balov. And this is my humble blog about Software Development. What you can find here?" ]
    , p [] [ text "Firstly, thoughts about exotic techs. Such as Elm or ClosureScript. E.g., I'm developing this blog with Elm. And it gives me an experience I want to document." ]
    , p [] [ text "Secondly, thoughts and recipes about mainstream techs. Such as React and TypeScript. I like React, and it is my main tool for everyday stuff. And TypeScript is a good addon to it." ]
    , p [] [ text "Thirdly, some notes about different topics around Software Development. E.g., I'm interested in mentoring and team-leading. And my notes may be useful for everyone who wants to grow to Senior level and higher." ]
    , p [ css [ Css.marginBottom Css.zero ] ] [ text "So, stay connected! I hope, this will be useful for you. And for me, of course! 🤓" ]
    ]

authorAbout : Model -> Html Message
authorAbout model =
  div
    [ css [ Css.color model.theme.textPrimary, Css.marginTop <| Css.px 70 ] ]
    [ header
    , div
        []
        [ div
            [ css
                [ Css.displayFlex
                , Css.property "gap" "20px"
                , Css.Media.withMedia
                  [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth <| Css.px 600 ] ]
                  [ Css.flexWrap Css.wrap ]
                ]
            ]
            [ picture model, description ]
          , footer model
        ]
    ]
