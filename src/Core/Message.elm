module Core.Message exposing (Message(..))

import Url
import Browser
import Http

import Core.FeatureData.FeatureData exposing (FeatureContent)

type Message =
  MessageLinkClicked Browser.UrlRequest
  | MessageUrlChanged Url.Url
  | MessageColorSchemaToggled String
  | MessageFeatureContentReceived (Result Http.Error FeatureContent)