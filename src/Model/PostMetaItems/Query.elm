module Model.PostMetaItems.Query exposing (queryPostMetaItems)

import Http

import Core.Message exposing (Message(..))
import Model.PostMetaItems.Config exposing (config)

queryPostMetaItems : Int -> Int -> Cmd Message
queryPostMetaItems step steps =
  Http.get
    { url = config.url
    , expect = Http.expectString (MessageFeatureContentReceived step steps)
    }
