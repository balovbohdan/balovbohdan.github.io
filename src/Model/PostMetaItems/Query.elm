module Model.PostMetaItems.Query exposing (queryPostMetaItems)

import Http

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))
import Model.PostMetaItems.Config exposing (config)

queryPostMetaItems : Model -> Int -> Int -> Cmd Message
queryPostMetaItems model step steps =
  Http.request
    { method = "GET"
    , url = config.url
    , expect = Http.expectString (MessageFeatureContentReceived step steps)
    , headers = [ Http.header "Authorization" ("token " ++ model.env.gitHub.token) ]
    , body = Http.emptyBody
    , timeout = Nothing
    , tracker = Nothing
    }
