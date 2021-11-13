module Model.PostMeta.Query exposing (queryPostMeta)

import Http

import Core.Message exposing (Message(..))
import Model.PostMeta.Config exposing (config)

queryPostMeta : Int -> Int -> String -> Cmd Message
queryPostMeta step steps name =
  Http.get
    { url = config.url ++ name
    , expect = Http.expectString (MessageFeatureContentReceived step steps)
    }
