module Features.Aeromodeling.Aeromodeling exposing (aeromodeling)

import Css
import Css.Media
import Json.Encode
import Html.Styled.Attributes exposing (css, href, src, alt, title, target, property)
import Html.Styled exposing (p, a, div, text, iframe, Html)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))

import Components.PageSection exposing (pageSection)

picture : Model -> Html Message
picture model =
  a
    [ target "__blank"
    , alt "F-1-B Free Flight"
    , title "F-1-B Free Flight"
    , href "https://www.flickr.com/photos/michal-dvorak/36133257921/in/pool-free-flight-models/"
    , css
        [ Css.display Css.block
        , Css.flexBasis <| Css.pct 50
        , Css.backgroundColor model.theme.primaryLight
        , Css.backgroundImage (Css.url "/assets/f1b-free-flight.jpg")
        , Css.backgroundSize Css.cover
        , Css.backgroundPosition Css.top
        , Css.Media.withMedia
            [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth <| Css.px 600 ] ]
            [ Css.flexBasis <| Css.pct 100, Css.height <| Css.vh 70 ]
        ]
    ]
    []

description : Model -> Html Message
description model =
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
    , p [ css [ Css.marginBottom Css.zero ] ] [ text "You may ask, how did I start it? Well... I was interested in inventing things from childhood. So, I started rather early with this hobby. Big thangs to trainers who suppored me during my path!" ]
    ]

freeFlightVideo : Html Message
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
    [ iframe
        [ src "https://www.youtube.com/embed/AAHrMaOCd1c"
        , property "allow" (Json.Encode.string "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture")
        , css
            [ Css.width <| Css.pct 100
            , Css.height <| Css.pct 100
            , Css.maxHeight <| Css.px 400
            ]
        ]
        []
    ]

freeFlightVideoDescription : Html Message
freeFlightVideoDescription =
  div
    [ css
        [ Css.flexBasis <| Css.pct 50
        , Css.Media.withMedia
            [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth <| Css.px 600 ] ]
            [ Css.flexBasis <| Css.pct 100 ]
        ]
    ]
    [ p [] [ text "I don't have a lot of content about this hobby. Maybe because when I was involved in it, I even did't think about taking photos or videos. For this reason, the photo above I found on the web." ]
    , p [] [ text "But thanks to Gods, I recently found an old video of my F-1-B free flight! I'm near 18 years old on that video. And the flight, actually, was not very good. But this is everything I have from that awesome times! Hope you will enjoy it." ]
    ]

body : Model -> Html Message
body model =
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
        [ picture model, description model ]
    , div
        [ css
            [ Css.displayFlex
            , Css.property "gap" "20px"
            , Css.marginTop <| Css.px 60
            , Css.Media.withMedia
              [ Css.Media.only Css.Media.screen [ Css.Media.maxWidth <| Css.px 600 ] ]
              [ Css.flexWrap Css.wrap ]
            ]
        ]
        [ freeFlightVideoDescription, freeFlightVideo ]
    ]

aeromodeling : Model -> Html Message
aeromodeling model =
  pageSection
    { model = model
    , title = "Aeromodeling"
    , body = body model
    , footer = Nothing
    }
