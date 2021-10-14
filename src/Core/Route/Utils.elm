module Core.Route.Utils exposing (getFeature, queryFeatureData)

import Url
import Html.Styled exposing (Html)
import Url.Parser exposing ((</>), parse, map, oneOf, top, Parser)

import Features.Home.Home exposing (home)
import Features.Home.Model exposing (queryHomeFeatureData)
import Features.NotFound.NotFound exposing (notFound)
import Features.Post.Post exposing (post)
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

queryFeatureData : String -> Cmd Message
queryFeatureData path =
  case (getRoute path) of
    NotFound -> Cmd.none
    Home -> queryHomeFeatureData
    Post _ -> Cmd.none
