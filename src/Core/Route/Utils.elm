module Core.Route.Utils exposing (getRoute, getFeature)

import Url
import Html.Styled exposing (Html)
import Url.Parser exposing ((</>), parse, map, oneOf, top, Parser)

import Core.Route.Route exposing (Route(..))
import Features.Home.Home exposing (home)
import Features.NotFound.NotFound exposing (notFound)
import Features.Post.Post exposing (post)
import Core.Message exposing (Message)
import Core.Model.Types exposing (Model)
import Core.Route.Parsers exposing (postUrlParser)

parseUrl : Parser (Route -> a) a
parseUrl =
  oneOf
    [ map RouteHome top
    , map RoutePost postUrlParser
    , map RouteNotFound top
    ]

getRoute : String -> Route
getRoute path =
  case Url.fromString path of
    Nothing -> RouteNotFound
    Just url ->
      Maybe.withDefault RouteNotFound (parse parseUrl url)

getFeature : String -> (Model -> Html Message)
getFeature path =
  case (getRoute path) of
    RouteNotFound -> notFound
    RouteHome -> home
    RoutePost _ -> post
