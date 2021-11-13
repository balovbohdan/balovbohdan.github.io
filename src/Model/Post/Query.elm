module Model.Post.Query exposing (queryPost)

import Http

import Core.Message exposing (Message(..))
import Model.Post.Config exposing (config)

queryPost : Int -> Int -> String -> Cmd Message
queryPost step steps id =
  Http.get
    { url = config.url ++ id ++ config.urlPostfix
    , expect = Http.expectString (MessageFeatureContentReceived step steps)
    }
