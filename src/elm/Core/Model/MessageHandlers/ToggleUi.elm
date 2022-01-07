module Core.Model.MessageHandlers.ToggleUi exposing (handleToggleUi)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))

handleToggleUi : Model -> Bool -> (Model, Cmd Message)
handleToggleUi model shouldShowUi =
  let
    featureData = model.featureData
    updatedFeatureData = { featureData | shouldShowUi = shouldShowUi }
    updatedModel = { model | featureData = updatedFeatureData }
  in
    (updatedModel, Cmd.none)
