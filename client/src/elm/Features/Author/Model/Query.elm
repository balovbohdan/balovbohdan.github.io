module Features.Author.Model.Query exposing (queryAuthorFeatureContent, parseAuthorFeatureContent)

import Array exposing (Array)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))

import Features.Author.Model.Config exposing (config)
import Features.Author.Model.Types exposing (AuthorFeatureContent)
import Model.PostMetaItems.Query exposing (queryPostMetaItems)

queryAuthorFeatureContent : Model -> Cmd Message
queryAuthorFeatureContent model =
  case (model.featureData.step) of
    0 -> queryPostMetaItems config.authorBrief.step config.steps -- this data is not used, workaround
    _ -> Cmd.none

parseAuthorFeatureContent : Array String -> AuthorFeatureContent
parseAuthorFeatureContent content = [{ content = "hello world" }]
