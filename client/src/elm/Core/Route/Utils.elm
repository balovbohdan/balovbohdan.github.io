module Core.Route.Utils exposing (getRoute, getFeature)

import Url
import Html.Styled exposing (Html)
import Url.Parser exposing (s, parse, map, oneOf, top, Parser)

import Features.Home.Home exposing (home)
import Features.NotFound.NotFound exposing (notFound)
import Features.Post.Post exposing (post)
import Features.Blog.Blog exposing (blog)
import Features.Author.Author exposing (author)
import Features.Aeromodeling.Aeromodeling exposing (aeromodeling)

import Core.Message exposing (Message)
import Core.Model.Types exposing (Model)
import Core.Route.Route exposing (Route(..))
import Core.Route.Parsers exposing (postUrlParser)

parseUrl : Parser (Route -> a) a
parseUrl =
  oneOf
    [ map RouteHome top
    , map RouteBlog (s "blog")
    , map RouteAuthor (s "author")
    , map RouteAeromodeling (s "aeromodeling")
    , map RoutePost postUrlParser
    , map RouteNotFound (s "404")
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
    RouteBlog -> blog
    RoutePost _ -> post
    RouteAuthor -> author
    RouteAeromodeling -> aeromodeling
