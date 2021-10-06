module Core.Route.Utils exposing (getFeature)

import Url
import Html.Styled exposing (Html)
import Url.Parser exposing ((</>), parse, map, oneOf, top, Parser)

import Features.Home exposing (home)
import Features.NotFound exposing (notFound)
import Features.Post exposing (post)
import Core.Message exposing (Message)
import Core.Model exposing (Model)
import Core.Route.Parsers exposing (postUrlParser)

type Route = Home | Post String | NotFound

parseUrl : Parser (Route -> a) a
parseUrl = oneOf [ map Home top, map Post postUrlParser ]

getRoute : String -> Route
getRoute path =
  case Url.fromString path of
    Nothing ->
      NotFound
    Just url ->
      Maybe.withDefault NotFound (parse parseUrl url)

getFeature : String -> (Model -> Html Message)
getFeature path =
  case (getRoute path) of
    NotFound -> notFound
    Home -> home
    Post _ -> post
