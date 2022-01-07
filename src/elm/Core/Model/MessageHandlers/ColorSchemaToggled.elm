module Core.Model.MessageHandlers.ColorSchemaToggled exposing (handleColorSchemaToggled)

import Json.Encode

import Ports exposing (localStorageOutcomePort)

import Core.Theme exposing (getTheme)
import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))

getColorSchemaToggledPortEvent : String -> String
getColorSchemaToggledPortEvent colorSchema =
  Json.Encode.object
    [ ("action", Json.Encode.string "set")
    , ("key", Json.Encode.string "colorSchema")
    , ("value", Json.Encode.string colorSchema)
    ]
    |> Json.Encode.encode 0

handleColorSchemaToggled : Model -> String -> (Model, Cmd Message)
handleColorSchemaToggled model colorSchema =
  let
    updatedModel = { model | colorSchema = colorSchema, theme = getTheme colorSchema }
    message = localStorageOutcomePort (getColorSchemaToggledPortEvent colorSchema)
  in
    (updatedModel, message)
