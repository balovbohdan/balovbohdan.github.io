module Core.Route.Route exposing (Route(..))

type Route = RouteHome | RouteBlog | RouteAuthor | RouteAeromodeling | RoutePost String | RouteNotFound
