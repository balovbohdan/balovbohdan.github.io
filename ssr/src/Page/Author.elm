module Page.Author exposing (Data, Model, Msg, page)

import Css
import Css.Media
import Css.Transitions
import Path
import Head
import Json.Encode
import Pages.Url
import Head.Seo
import Browser.Navigation
import View exposing (View)
import DataSource exposing (DataSource)
import Page exposing (Page, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Html.Styled exposing (p, a, h3, div, img, text, toUnstyled, Html)
import Html.Styled.Attributes exposing (css, src, href)

import Shared
import Core.Constants exposing (coreConstants)
import Components.PageSection exposing (pageSection)

type alias Model = ()

type alias Msg = Never

type alias RouteParams = {}

type alias Data = ()

-- bio

picture : Shared.Model -> Html Msg
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

description : Html Msg
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

body : Shared.Model -> Html Msg
body model =
  div
    [ css
        [ Css.displayFlex
        , Css.property "gap" "20px"
        , Css.Media.withMedia
          [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth <| Css.px 600 ] ]
          [ Css.flexWrap Css.wrap ]
        ]
    ]
    [ picture model, description ]

bio : Shared.Model -> Html Msg
bio model =
  pageSection
    { theme = model.theme
    , title = "Nerdy bio"
    , body = body model
    , footer = Nothing
    }

-- interests

type alias TileProps =
  { model: Shared.Model
  , title: String
  , description: String
  , href: String
  , iconSrc: String
  }

tileHeader : TileProps -> Html Msg
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

tile : TileProps -> Html Msg
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

tiles : Shared.Model -> Html Msg
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
        , href = "/posts/why-i-decided-to-drop-react"
        }
    , tile
        { model = model
        , title = "Functional Programming"
        , description = "As for me, FP is a good thing for developing reliable apps."
        , iconSrc = "/assets/cpu.svg"
        , href = "/posts/fp-notes-purity-1"
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
        , description = "This is my passion. But it is currently on pause because of the Software Engineer career."
        , iconSrc = "/assets/plane.svg"
        , href = "/aeromodeling"
        }
    ]

interests : Shared.Model -> Html Msg
interests model =
  pageSection
    { theme = model.theme
    , title = "Interests"
    , body = tiles model
    , footer = Nothing
    }

author : Shared.Model -> Html Msg
author model = div [] [ bio model, interests model ]

-- meta

view : Maybe PageUrl -> Shared.Model -> Model -> StaticPayload Data RouteParams -> View Msg
view maybeUrl sharedModel templateModel static =
  { title = "Mr. Balov | About Author"
  , body = [ toUnstyled (author sharedModel) ]
  }

data : DataSource Data
data = DataSource.succeed ()

head : StaticPayload Data RouteParams -> List Head.Tag
head static =
  Head.Seo.summary
    { canonicalUrlOverride = Nothing
    , siteName = "Mr. Balov"
    , description = "About Mr. Balov"
    , locale = Just "en"
    , title = "About Mr. Balov"
    , image =
        { url = Pages.Url.external (coreConstants.url ++ "assets/author-2.jpg")
        , alt = "About Mr. Balov"
        , dimensions = Nothing
        , mimeType = Nothing
        }
    }
    |> Head.Seo.website

init : Maybe PageUrl -> Shared.Model -> StaticPayload Data RouteParams -> (Model, Cmd Msg)
init pageUrl sharedModel static = ((), Cmd.none)

update:
  PageUrl
  -> Maybe Browser.Navigation.Key
  -> Shared.Model
  -> StaticPayload Data RouteParams
  -> Msg
  -> Model
  -> (Model, Cmd templateMsg, Maybe Shared.Msg)
update pageUrl navigationKey sharedModel static templateMessage templateModel =
  (templateModel, Cmd.none, Nothing)

subscriptions:
  Maybe PageUrl
  -> RouteParams
  -> Path.Path
  -> Model
  -> Shared.Model
  -> Sub templateMsg
subscriptions pageUrl routeParams path model sharedModel = Sub.none

page : Page RouteParams Data
page =
  let
    singlePage = Page.single { head = head, data = data }
    pageWithSharedState =
      Page.buildWithSharedState
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
  in
    singlePage |> pageWithSharedState
