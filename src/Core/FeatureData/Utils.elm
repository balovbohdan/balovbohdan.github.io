module Core.FeatureData.Utils exposing (queryFeatureContent)

import Core.Route.Route exposing (Route(..))
import Core.Message exposing (Message(..))
import Core.Route.Utils exposing (getRoute)
import Features.Home.Model exposing (queryHomeFeatureContent)
import Features.Post.Model exposing (queryPostFeatureContent)

queryFeatureContent : String -> Cmd Message
queryFeatureContent path =
  case (getRoute path) of
    RouteNotFound -> Cmd.none
    RouteHome -> queryHomeFeatureContent
    RoutePost id -> queryPostFeatureContent id
