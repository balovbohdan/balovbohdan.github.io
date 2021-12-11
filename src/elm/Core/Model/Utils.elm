module Core.Model.Utils exposing (updateModel, getInitialModel)

import Url
import Array
import Browser
import Browser.Navigation
import Json.Encode

import Core.Model.Types exposing (Model)
import Core.Flags exposing (Flags)
import Core.Message exposing (Message(..))
import Core.Theme exposing (getTheme)
import Ports exposing (localStorageOutcomePort)
import Core.FeatureData.Utils exposing (queryFeatureContent)
import Core.FeatureData.FeatureData exposing (defaultFeatureData)

getColorSchemaToggledPortEvent : String -> String
getColorSchemaToggledPortEvent colorSchema =
  Json.Encode.object
    [ ("action", Json.Encode.string "set")
    , ("key", Json.Encode.string "colorSchema")
    , ("value", Json.Encode.string colorSchema)
    ]
    |> Json.Encode.encode 0

getInitialModel : Flags -> Browser.Navigation.Key -> Url.Url -> Model
getInitialModel flags key url =
  { key = key
  , url = url
  , colorSchema = flags.colorSchema
  , theme = getTheme flags.colorSchema
  , featureData = defaultFeatureData
  }

updateModel : Message -> Model -> ( Model, Cmd Message )
updateModel message model =
  case message of
    MessageLinkClicked urlRequest ->
      case urlRequest of
        Browser.Internal url ->
          ( model, Browser.Navigation.pushUrl model.key (Url.toString url) )
        Browser.External href ->
          ( model, Browser.Navigation.load href )

    MessageUrlChanged url ->
      let
        updatedModel = { model | url = url, featureData = defaultFeatureData }
      in
        ( updatedModel
        , queryFeatureContent updatedModel (Url.toString url)
        )

    MessageColorSchemaToggled colorSchema ->
      ( { model | colorSchema = colorSchema, theme = getTheme colorSchema }
      , localStorageOutcomePort (getColorSchemaToggledPortEvent colorSchema)
      )

    MessageFeatureContentReceived step steps result ->
      let
        lastStep = steps - 1
        hasNextStep = step < lastStep
      in
        case result of
          Ok featureContent ->
            let
              updatedModel =
                { model | featureData =
                  { loading = hasNextStep
                  , step = step + 1
                  , content = Array.push featureContent model.featureData.content
                  }
                }
            in
              ( updatedModel
              , if (hasNextStep) then
                  queryFeatureContent updatedModel (Url.toString model.url)
                else
                  Cmd.none
              )
          Err _ ->
            ( model, Cmd.none )
