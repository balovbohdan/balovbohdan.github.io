module Core.Model.Utils exposing (updateModel, getInitialModel)

import Url
import Browser.Navigation

import Core.Model.Types exposing (Model)
import Core.Flags exposing (Flags)
import Core.Message exposing (Message(..))
import Core.Theme exposing (getTheme)
import Core.FeatureData.FeatureData exposing (defaultFeatureData)

import Core.Model.MessageHandlers.ColorSchemaToggled exposing (handleColorSchemaToggled)
import Core.Model.MessageHandlers.FeatureContentReceived exposing (handleFeatureContentReceived)
import Core.Model.MessageHandlers.InternalLinkClicked exposing (handleInternalLinkClicked)
import Core.Model.MessageHandlers.LinkClicked exposing (handleLinkClicked)
import Core.Model.MessageHandlers.ToggleUi exposing (handleToggleUi)
import Core.Model.MessageHandlers.UrlChanged exposing (handleUrlChanged)

getInitialModel : Flags -> Browser.Navigation.Key -> Url.Url -> Model
getInitialModel flags key url =
  { key = key
  , url = url
  , colorSchema = flags.colorSchema
  , theme = getTheme flags.colorSchema
  , featureData = defaultFeatureData
  }

updateModel : Message -> Model -> (Model, Cmd Message)
updateModel message model =
  case message of
    MessageLinkClicked urlRequest ->
      handleLinkClicked model urlRequest
    MessageInternalLinkClicked url ->
      handleInternalLinkClicked model url
    MessageUrlChanged url ->
      handleUrlChanged model url
    MessageColorSchemaToggled colorSchema ->
      handleColorSchemaToggled model colorSchema
    MessageToggleUi visibleUi ->
      handleToggleUi model visibleUi
    MessageFeatureContentReceived step steps result ->
      handleFeatureContentReceived model step steps result
