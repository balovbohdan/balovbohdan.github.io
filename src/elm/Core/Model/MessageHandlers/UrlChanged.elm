module Core.Model.MessageHandlers.UrlChanged exposing (handleUrlChanged)

import Url

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))

import Core.FeatureData.Utils exposing (queryFeatureContent)
import Core.FeatureData.FeatureData exposing (defaultFeatureData)

handleUrlChanged : Model -> Url.Url -> (Model, Cmd Message)
handleUrlChanged model url =
  let
    updatedModel = { model | url = url, featureData = defaultFeatureData }
    message = queryFeatureContent updatedModel (Url.toString url)
  in
    (updatedModel, message)
