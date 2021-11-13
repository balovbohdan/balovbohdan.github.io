module Model.PostMeta.Query exposing (queryPostMeta)

import Http

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))
import Model.PostMeta.Config exposing (config)

queryPostMeta : Model -> Int -> Int -> String -> Cmd Message
queryPostMeta model step steps name =
  Http.request
    { method = "GET"
    , url = config.url ++ name
    , expect = Http.expectString (MessageFeatureContentReceived step steps)
    , headers = [ Http.header "Authorization" ("token " ++ model.env.gitHub.token) ]
    , body = Http.emptyBody
    , timeout = Nothing
    , tracker = Nothing
    }
