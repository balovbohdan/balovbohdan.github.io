module Main exposing (main)

import Browser
import Browser.Navigation
import Url
import Json.Encode
import Html.Styled exposing (toUnstyled)
import Html.Styled.Attributes exposing (href)

import Core.App exposing (app)
import Core.Model exposing (Model)
import Core.Message exposing (Message(..))
import Core.Theme exposing (getTheme)
import Core.Utils.PageTitle exposing (getPageTitle)
import Ports exposing (localStorageOutcomePort)

type alias Flags = { colorSchema: String }

getInitialModel : Flags -> Browser.Navigation.Key -> Url.Url -> Model
getInitialModel flags key url =
  { key = key
  , url = url
  , colorSchema = flags.colorSchema
  , theme = getTheme flags.colorSchema
  }

init : Flags -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Message )
init flags url key = ( getInitialModel flags key url, Cmd.none )

subscriptions : Model -> Sub Message
subscriptions _ = Sub.none

getColorSchemaToggledPortEvent : String -> String
getColorSchemaToggledPortEvent colorSchema =
  Json.Encode.object
    [ ("action", Json.Encode.string "set")
    , ("key", Json.Encode.string "colorSchema")
    , ("value", Json.Encode.string colorSchema)
    ]
    |> Json.Encode.encode 0

update : Message -> Model -> ( Model, Cmd Message )
update message model =
  case message of
    MessageLinkClicked urlRequest ->
      case urlRequest of
        Browser.Internal url ->
          ( model, Browser.Navigation.pushUrl model.key (Url.toString url) )
        Browser.External href ->
          ( model, Browser.Navigation.load href )

    MessageUrlChanged url ->
      ( { model | url = url }, Cmd.none )

    MessageColorSchemaToggled colorSchema ->
      ( { model | colorSchema = colorSchema, theme = getTheme colorSchema }
      , localStorageOutcomePort (getColorSchemaToggledPortEvent colorSchema)
      )

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
    , update = update
    , subscriptions = subscriptions
    , onUrlChange = MessageUrlChanged
    , onUrlRequest = MessageLinkClicked
    }
