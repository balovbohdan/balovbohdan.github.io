module Main exposing (main)

import Browser
import Browser.Navigation
import Url
import Html.Styled exposing (toUnstyled)
import Html.Styled.Attributes exposing (href)

import Core.Utils
import Core.App exposing (app)
import Core.Model exposing (Model)
import Core.Theme exposing (getTheme)

type Message = LinkClicked Browser.UrlRequest | UrlChanged Url.Url

getInitialModel : Browser.Navigation.Key -> Url.Url -> String -> Model
getInitialModel key url colorSchema =
  { key = key
  , url = url
  , colorSchema = colorSchema
  , theme = getTheme colorSchema
  }

init : () -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Message )
init flags url key = ( getInitialModel key url "light", Cmd.none )

subscriptions : Model -> Sub Message
subscriptions _ = Sub.none

update : Message -> Model -> ( Model, Cmd Message )
update message model =
  case message of
    LinkClicked urlRequest ->
      case urlRequest of
        Browser.Internal url ->
          ( model, Browser.Navigation.pushUrl model.key (Url.toString url) )

        Browser.External href ->
          ( model, Browser.Navigation.load href )

    UrlChanged url ->
      ( { model | url = url }, Cmd.none )

view : Model -> Browser.Document Message
view model =
  { title = Core.Utils.getPageTitle model
  , body = [ toUnstyled (app model) ]
  }

main : Program () Model Message
main =
  Browser.application
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlChange = UrlChanged
    , onUrlRequest = LinkClicked
    }
