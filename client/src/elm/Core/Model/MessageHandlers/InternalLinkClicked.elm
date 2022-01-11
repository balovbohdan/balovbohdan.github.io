module Core.Model.MessageHandlers.InternalLinkClicked exposing (handleInternalLinkClicked)

import Url
import Browser.Navigation

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))

handleInternalLinkClicked : Model -> Url.Url -> (Model, Cmd Message)
handleInternalLinkClicked model url =
  let
    message = Browser.Navigation.pushUrl model.key (Url.toString url)
  in
    (model, message)
