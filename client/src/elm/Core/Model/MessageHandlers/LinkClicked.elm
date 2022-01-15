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
    scrollToTopDelay = constants.uiOpacityTransitionDuration + 2 * constants.uiOpacityTransitionDelay
    message =
      Delay.sequence
        [ (constants.internalLinkNavigationDelay, MessageToggleUi False)
        , (scrollToTopDelay, MessageScrollToTop)
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
