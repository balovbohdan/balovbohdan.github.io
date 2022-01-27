module Core.FeatureData.Utils exposing (queryFeatureContent)

import Core.Model.Types exposing (Model)
import Core.Route.Route exposing (Route(..))
import Core.Message exposing (Message(..))
import Core.Route.Utils exposing (getRoute)

import Features.Home.Model.Query exposing (queryHomeFeatureContent)
import Features.Blog.Model.Query exposing (queryPostsFeatureContent)
import Features.Post.Model.Query exposing (queryPostFeatureContent)
import Features.Author.Model.Query exposing (queryAuthorFeatureContent)
import Features.Aeromodeling.Model.Query exposing (queryAeromodelingFeatureContent)

queryFeatureContent : Model -> String -> Cmd Message
queryFeatureContent model path =
  case (getRoute path) of
    RouteNotFound -> Cmd.none
    RouteHome -> queryHomeFeatureContent model
    RouteBlog -> queryPostsFeatureContent model
    RoutePost id -> queryPostFeatureContent model id
    RouteAuthor -> queryAuthorFeatureContent model
    RouteAeromodeling -> queryAeromodelingFeatureContent model
