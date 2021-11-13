module Model.Post.Query exposing (queryPost)

import Http

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))
import Model.Post.Config exposing (config)

queryPost : Model -> Int -> Int -> String -> Cmd Message
queryPost model step steps id =
  Http.request
    { method = "GET"
    , url = config.url ++ id ++ "/" ++ id ++ config.extension
    , expect = Http.expectString (MessageFeatureContentReceived step steps)
    , headers = [ Http.header "Authorization" ("token " ++ model.env.gitHub.token) ]
    , body = Http.emptyBody
    , timeout = Nothing
    , tracker = Nothing
    }
