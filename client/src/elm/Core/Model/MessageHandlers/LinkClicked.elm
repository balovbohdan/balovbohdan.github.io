module Core.Model.MessageHandlers.LinkClicked exposing (handleLinkClicked)

import Url
import Delay
import Browser
import Browser.Navigation

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))
import Core.Constants exposing (constants)

handleInternalLinkClicked : Model -> Url.Url -> (Model, Cmd Message)
handleInternalLinkClicked model url =
  let
    message =
      Delay.sequence
        [ (constants.internalLinkNavigationDelay, MessageToggleUi False)
        , (constants.uiOpacityTransitionDuration, MessageScrollToTop)
        , (constants.internalLinkNavigationDelay, MessageInternalLinkClicked url)
        ]
  in
    (model, message)

handleLinkClicked : Model -> Browser.UrlRequest -> (Model, Cmd Message)
handleLinkClicked model urlRequest =
  case urlRequest of
    Browser.Internal url ->
      handleInternalLinkClicked model url
    Browser.External href ->
      (model, Browser.Navigation.load href)
