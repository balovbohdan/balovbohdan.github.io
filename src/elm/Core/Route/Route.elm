module Core.Route.Route exposing (Route(..))

type Route = RouteHome | RouteBlog | RouteAuthor | RoutePost String | RouteNotFound
