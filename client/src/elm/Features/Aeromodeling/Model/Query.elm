module Features.Aeromodeling.Model.Query exposing (queryAeromodelingFeatureContent, parseAeromodelingFeatureContent)

import Array exposing (Array)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))

import Features.Aeromodeling.Model.Config exposing (config)
import Features.Aeromodeling.Model.Types exposing (AeromodelingFeatureContent)
import Model.PostMetaItems.Query exposing (queryPostMetaItems)

queryAeromodelingFeatureContent : Model -> Cmd Message
queryAeromodelingFeatureContent model =
  case (model.featureData.step) of
    0 -> queryPostMetaItems config.description.step config.steps -- this data is not used, workaround
    _ -> Cmd.none

parseAeromodelingFeatureContent : Array String -> AeromodelingFeatureContent
parseAeromodelingFeatureContent content = [{ content = "hello world" }]
