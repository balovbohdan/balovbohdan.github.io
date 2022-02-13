module Page.Aeromodeling exposing (Data, Model, Msg, page)

import Css
import Css.Media
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
import Html.Styled.Attributes exposing (css, href, src, alt, title, target, property)
import Html.Styled exposing (p, a, div, text, video, source, toUnstyled, Html)

import Shared
import Core.Constants exposing (coreConstants)
import Components.PageSection exposing (pageSection)

type alias Model = ()

type alias Msg = Never

type alias RouteParams = {}

type alias Data = ()

-- feature

picture : Shared.Model -> Html Msg
picture sharedModel =
  a
    [ target "__blank"
    , alt "F-1-B Free Flight"
    , title "F-1-B Free Flight"
    , href "https://www.flickr.com/photos/michal-dvorak/36133257921/in/pool-free-flight-models/"
    , css
        [ Css.display Css.block
        , Css.flexBasis <| Css.pct 50
        , Css.backgroundColor sharedModel.theme.primaryLight
        , Css.backgroundImage (Css.url "/assets/f1b-free-flight.jpg")
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
    [ p [ css [ Css.marginTop Css.zero ] ] [ text "This is my passion. But this activity is currently on hold because of my Software Engineer career — it takes really too much time." ]
    , p [] [ text "I have plans for the future to proceed with this sport. It gives big pleasure to me. Maybe because I feel free and relaxed on an aerodrome with an expensive flying toy. 🛩️" ]
    , p [ css [ Css.marginBottom Css.zero ] ] [ text "You may ask, how did I start it? Well... I was interested in inventing things from childhood. So, I started rather early with this hobby. Big thanks to trainers who supported me during my path!" ]
    ]

freeFlightVideo : Html Msg
freeFlightVideo =
  div
    [ css
        [ Css.displayFlex
        , Css.alignItems Css.center
        , Css.flexBasis <| Css.pct 50
        , Css.Media.withMedia
            [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth <| Css.px 600 ] ]
            [ Css.flexBasis <| Css.pct 100, Css.height <| Css.vh 70 ]
        ]
    ]
    [ video
        [ property "controls" (Json.Encode.string "true")
        , css
            [ Css.width <| Css.pct 100
            , Css.height <| Css.pct 100
            , Css.maxHeight <| Css.px 400
            ]
        ]
        [ source
            [ property "type" (Json.Encode.string "video/mp4")
            , src "/assets/f1b-free-flight.mp4"
            ]
            []
        ]
    ]

freeFlightVideoDescription : Html Msg
freeFlightVideoDescription =
  div
    [ css
        [ Css.flexBasis <| Css.pct 50
        , Css.Media.withMedia
            [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth <| Css.px 600 ] ]
            [ Css.flexBasis <| Css.pct 100 ]
        ]
    ]
    [ p [] [ text "I don't have a lot of content about this hobby. Maybe because when I was involved in it, I even didn't think about taking photos or videos. For this reason, the photo above I found on the web." ]
    , p [] [ text "But thanks to Gods, I recently found an old video of my F-1-B free flight! I'm near 18 years old on that video. And the flight, actually, was not very good. But this is everything I have from that awesome times! Hope you will enjoy it." ]
    ]

body : Shared.Model -> Html Msg
body sharedModel =
  div
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
        [ picture sharedModel, description ]
    , div
        [ css
            [ Css.displayFlex
            , Css.property "gap" "20px"
            , Css.alignItems Css.center
            , Css.marginTop <| Css.px 60
            , Css.Media.withMedia
              [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth <| Css.px 600 ] ]
              [ Css.flexWrap Css.wrap ]
            ]
        ]
        [ freeFlightVideoDescription, freeFlightVideo ]
    ]

aeromodeling : Shared.Model -> Html Msg
aeromodeling sharedModel =
  pageSection
    { theme = sharedModel.theme
    , title = "Aeromodeling"
    , body = body sharedModel
    , footer = Nothing
    }

-- meta

view : Maybe PageUrl -> Shared.Model -> Model -> StaticPayload Data RouteParams -> View Msg
view maybeUrl sharedModel templateModel static =
  { title = "Aeromodeling | Mr. Balov"
  , body = [ toUnstyled (aeromodeling sharedModel) ]
  }

data : DataSource Data
data = DataSource.succeed ()

head : StaticPayload Data RouteParams -> List Head.Tag
head static =
  Head.Seo.summary
    { canonicalUrlOverride = Nothing
    , siteName = "Mr. Balov"
    , description = "Aeromodeling | Mr. Balov"
    , locale = Just "en"
    , title = "Aeromodeling | Mr. Balov"
    , image =
        { url = Pages.Url.external (coreConstants.url ++ "assets/f1b-free-flight.jpg")
        , alt = "Aeromodeling | Mr. Balov"
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
