module Model.PostMetaItems.Query exposing (queryPostMetaItems)

import Http

import Env
import Core.Message exposing (Message(..))
import Model.PostMetaItems.Config exposing (config)

queryPostMetaItems : Int -> Int -> Cmd Message
queryPostMetaItems step steps =
  Http.request
    { method = "GET"
    , url = config.url ++ config.parameters
    , expect = Http.expectString (MessageFeatureContentReceived step steps)
    , headers = [ Http.header "Authorization" Env.tokenGithub ]
    , body = Http.emptyBody
    , timeout = Nothing
    , tracker = Nothing
    }
