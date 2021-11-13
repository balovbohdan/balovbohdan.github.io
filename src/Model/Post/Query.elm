module Model.Post.Query exposing (queryPost)

import Http

import Env
import Core.Message exposing (Message(..))
import Model.Post.Config exposing (config)

queryPost : Int -> Int -> String -> Cmd Message
queryPost step steps id =
  Http.request
    { method = "GET"
    , url = config.url ++ id ++ "/" ++ id ++ config.extension
    , expect = Http.expectString (MessageFeatureContentReceived step steps)
    , headers = [ Http.header "Authorization" Env.tokenGithub ]
    , body = Http.emptyBody
    , timeout = Nothing
    , tracker = Nothing
    }
