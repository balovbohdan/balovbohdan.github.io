module Shared exposing (Data, Model, Msg(..), template)

import Html.Styled
import Browser.Navigation
import DataSource
import Html exposing (Html)
import Pages.Flags exposing (Flags(..))
import Pages.PageUrl exposing (PageUrl)
import Path exposing (Path)
import Route exposing (Route)
import SharedTemplate exposing (SharedTemplate)
import View exposing (View)

import Core.Flags exposing (decodeFlags)
import Core.Theme exposing (getTheme, Theme)
import Core.Ports exposing (localStorageOutcomePort)
import Core.Model.Utils exposing (getColorSchemaToggledPortEvent)

import Components.Layout exposing (layout)
import Html.Attributes exposing (checked)

type alias Data = ()

type alias Model =
  { theme: Theme
  , colorSchema: String
  }

type Msg =
  OnThemeToggle String
  | OnPageChange
      { path : Path
      , query : Maybe String
      , fragment : Maybe String
      }

template : SharedTemplate Msg Model Data message
template =
  { init = init
  , update = update
  , view = view
  , data = data
  , subscriptions = subscriptions
  , onPageChange = Just OnPageChange
  }

init :
  Maybe Browser.Navigation.Key
  -> Pages.Flags.Flags
  ->
    Maybe
      { path :
        { path : Path
        , query : Maybe String
        , fragment : Maybe String
        }
      , metadata : route
      , pageUrl : Maybe PageUrl
      }
  -> ( Model, Cmd Msg )
init navigationKey flags maybePagePath =
  let
    flagsDecoded = decodeFlags flags
    colorSchema = flagsDecoded.colorSchema
  in
    ({ colorSchema = colorSchema
    , theme = getTheme colorSchema
    }, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update message model =
  case message of
    OnPageChange _ ->
      (model, Cmd.none)
    OnThemeToggle colorSchema ->
      let
        nextMessage = localStorageOutcomePort <| getColorSchemaToggledPortEvent <| colorSchema
        updatedModel = { model | colorSchema = colorSchema, theme = getTheme colorSchema }
      in
        (updatedModel, nextMessage)

subscriptions : Path -> Model -> Sub Msg
subscriptions _ _ = Sub.none

data : DataSource.DataSource Data
data = DataSource.succeed ()

onThemeToggle : (Msg -> message) -> Bool -> message
onThemeToggle toMessage checked =
  let
    nextColorSchema = if checked then "dark" else "light"
    themeToggleMessage = OnThemeToggle nextColorSchema
  in
    toMessage themeToggleMessage

bodyWrapper : (Msg -> message) -> Model -> View message -> Html message
bodyWrapper toMessage model pageView =
  let
    pageViewBodyStyled = List.map Html.Styled.fromUnstyled pageView.body
    layoutStyled =
      layout
        { theme = model.theme
        , colorSchema = model.colorSchema
        , feature = Html.Styled.div [] pageViewBodyStyled
        , visibleFooter = True
        , onThemeToggle = onThemeToggle toMessage
        }
  in
    Html.Styled.toUnstyled layoutStyled

view :
  Data
  -> { path: Path, route: Maybe Route }
  -> Model
  -> (Msg -> message)
  -> View message
  -> { body : Html message, title : String }
view sharedData page model toMessage pageView =
  { title = pageView.title
  , body = bodyWrapper toMessage model pageView
  }
