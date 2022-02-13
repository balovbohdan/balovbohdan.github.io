module Page.Aeromodeling exposing (Data, Model, Msg, page)

import Path
import Head
import Pages.Url
import Head.Seo
import Browser.Navigation
import View exposing (View)
import DataSource exposing (DataSource)
import Page exposing (Page, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Html.Styled exposing (text, toUnstyled)

import Shared

type alias Model = ()

type alias Msg = Never

type alias RouteParams = {}

type alias Data = ()

data : DataSource Data
data = DataSource.succeed ()

head : StaticPayload Data RouteParams -> List Head.Tag
head static =
  Head.Seo.summary
    { canonicalUrlOverride = Nothing
    , siteName = "elm-pages"
    , image =
        { url = Pages.Url.external "TODO"
        , alt = "elm-pages logo"
        , dimensions = Nothing
        , mimeType = Nothing
        }
    , description = "TODO"
    , locale = Nothing
    , title = "TODO title" -- metadata.title -- TODO
    }
    |> Head.Seo.website

view : Maybe PageUrl -> Shared.Model -> Model -> StaticPayload Data RouteParams -> View Msg
view maybeUrl sharedModel templateModel static =
  { title = "Mr. Balov | Aeromodeling"
  , body = [ toUnstyled (text "hola!") ]
  }

init : Maybe PageUrl -> Shared.Model -> StaticPayload Data RouteParams -> (Model, Cmd Msg)
init pageUrl sharedModel static = ((), Cmd.none)

update:
  PageUrl
  -> Maybe Browser.Navigation.Key
  -> Shared.Model
  -> StaticPayload Data RouteParams
  -> Msg
  -> Model
  -> (Model, Cmd templateMsg, Maybe Shared.Msg)
update pageUrl navigationKey sharedModel static templateMessage templateModel =
  (templateModel, Cmd.none, Nothing)

subscriptions:
  Maybe PageUrl
  -> RouteParams
  -> Path.Path
  -> Model
  -> Shared.Model
  -> Sub templateMsg
subscriptions pageUrl routeParams path model sharedModel = Sub.none

page : Page RouteParams Data
page =
  let
    singlePage = Page.single { head = head, data = data }
    pageWithSharedState =
      Page.buildWithSharedState
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
  in
    singlePage |> pageWithSharedState
