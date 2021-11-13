module Core.FeatureData.Utils exposing (queryFeatureContent)

import Core.Model.Types exposing (Model)
import Core.Route.Route exposing (Route(..))
import Core.Message exposing (Message(..))
import Core.Route.Utils exposing (getRoute)
import Features.Home.Model exposing (queryHomeFeatureContent)
import Features.Post.Model exposing (queryPostFeatureContent)

queryFeatureContent : Model -> String -> Cmd Message
queryFeatureContent model path =
  case (getRoute path) of
    RouteNotFound -> Cmd.none
    RouteHome -> queryHomeFeatureContent model
    RoutePost id -> queryPostFeatureContent id
