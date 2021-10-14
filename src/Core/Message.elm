module Core.Message exposing (Message(..))

import Url
import Browser
import Http

import Core.Model exposing (PostPreview)

type Message =
  MessageLinkClicked Browser.UrlRequest
  | MessageUrlChanged Url.Url
  | MessageColorSchemaToggled String
  | MessagePostsReceived (Result Http.Error PostPreview)
