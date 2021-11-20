module Core.Route.Route exposing (Route(..))

type Route = RouteHome | RouteBlog | RoutePost String | RouteNotFound
