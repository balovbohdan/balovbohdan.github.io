module Core.Message exposing (Message(..))

import Url
import Browser

type Message =
  MessageLinkClicked Browser.UrlRequest
  | MessageUrlChanged Url.Url
  | MessageColorSchemaToggled String
