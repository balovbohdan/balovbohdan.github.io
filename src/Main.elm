module Main exposing (main)

import Browser
import Browser.Navigation
import Url
import Html.Styled exposing (toUnstyled)

import Core.App exposing (app)
import Core.Model.Types exposing (Model)
import Core.Model.Utils exposing (updateModel, getInitialModel)
import Core.Message exposing (Message(..))
import Core.Flags exposing (Flags)
import Core.Utils.PageTitle exposing (getPageTitle)
import Core.FeatureData.Utils exposing (queryFeatureContent)

init : Flags -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Message )
init flags url key =
  let
    initialModel = getInitialModel flags key url
  in
    ( initialModel
    , queryFeatureContent initialModel (Url.toString url)
    )

subscriptions : Model -> Sub Message
subscriptions _ = Sub.none

view : Model -> Browser.Document Message
view model =
  { title = getPageTitle model
  , body = [ toUnstyled (app model) ]
  }

main : Program Flags Model Message
main =
  Browser.application
    { init = init
    , view = view
    , update = updateModel
    , subscriptions = subscriptions
    , onUrlChange = MessageUrlChanged
    , onUrlRequest = MessageLinkClicked
    }
