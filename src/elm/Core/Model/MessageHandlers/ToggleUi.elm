module Core.Model.MessageHandlers.ToggleUi exposing (handleToggleUi)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))

handleToggleUi : Model -> Bool -> (Model, Cmd Message)
handleToggleUi model visibleUi =
  let
    featureData = model.featureData
    updatedFeatureData = { featureData | visibleUi = visibleUi }
    updatedModel = { model | featureData = updatedFeatureData }
  in
    (updatedModel, Cmd.none)
