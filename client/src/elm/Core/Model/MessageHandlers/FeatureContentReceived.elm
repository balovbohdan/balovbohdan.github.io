module Core.Model.MessageHandlers.FeatureContentReceived exposing (handleFeatureContentReceived)

import Url
import Http
import Array
import Delay

import Ports exposing (metaChangePort)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))
import Core.FeatureData.FeatureData exposing (FeatureContent)
import Core.FeatureData.Utils exposing (queryFeatureContent)
import Core.Constants exposing (constants)

getLastStepIndex : Int -> Int
getLastStepIndex steps = steps - 1

getHasNextStep : Int -> Int -> Bool
getHasNextStep step steps = step < (getLastStepIndex steps)

updateModel : Model -> Int -> Int -> FeatureContent -> Model
updateModel model step steps featureContent =
  let
    hasNextStep = getHasNextStep step steps
    updatedFeatureData =
      { loading = hasNextStep
      , visibleUi = model.featureData.visibleUi
      , step = step + 1
      , content = Array.push featureContent model.featureData.content
      }
  in
    { model | featureData = updatedFeatureData }

getMessage : Model -> Int -> Int -> Cmd Message
getMessage model step steps =
  let
    hasNextStep = getHasNextStep step steps
  in
    if (hasNextStep) then
      queryFeatureContent model (Url.toString model.url)
    else
      Cmd.batch
        [ metaChangePort model.featureData.content
        , Delay.after constants.toggleUiDelay (MessageToggleUi True)
        ]

handleFeatureContent : Model -> Int -> Int -> FeatureContent -> (Model, Cmd Message)
handleFeatureContent model step steps  featureContent =
  let
    updatedModel = updateModel model step steps featureContent
    message = getMessage updatedModel step steps
  in
    (updatedModel, message)

handleFeatureContentReceived : Model -> Int -> Int -> (Result Http.Error FeatureContent) -> (Model, Cmd Message)
handleFeatureContentReceived model step steps result =
  case result of
    Ok featureContent ->
      handleFeatureContent model step steps featureContent
    Err _ ->
      (model, Cmd.none)
