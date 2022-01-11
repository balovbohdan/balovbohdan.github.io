module Core.Message exposing (Message(..))

import Url
import Browser
import Http

import Core.FeatureData.FeatureData exposing (FeatureContent)

type Message =
  MessageLinkClicked Browser.UrlRequest
  | MessageInternalLinkClicked Url.Url
  | MessageUrlChanged Url.Url
  | MessageColorSchemaToggled String
  | MessageToggleUi Bool
  | MessageFeatureContentReceived Int Int (Result Http.Error FeatureContent)
