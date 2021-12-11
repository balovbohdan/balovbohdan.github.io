module Model.PostMeta.Query exposing (queryPostMeta)

import Http

import Env
import Core.Message exposing (Message(..))
import Model.PostMeta.Config exposing (config)

queryPostMeta : Int -> Int -> String -> Cmd Message
queryPostMeta step steps name =
  Http.request
    { method = "GET"
    , url = config.url ++ name
    , expect = Http.expectString (MessageFeatureContentReceived step steps)
    , headers = [ Http.header "Authorization" Env.tokenGithub ]
    , body = Http.emptyBody
    , timeout = Nothing
    , tracker = Nothing
    }
