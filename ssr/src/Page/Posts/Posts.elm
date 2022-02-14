module Page.Posts.Posts exposing (Data, Model, Msg, page)

import Css
import Array
import Url
import Path
import Head
import Head.Seo
import Browser.Navigation
import Json.Encode
import Pages.Url
import View exposing (View)
import DataSource exposing (DataSource)
import Page exposing (Page, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Html.Styled.Attributes exposing (css, href, target)
import Html.Styled exposing (a, div, span, text, toUnstyled, Html)
import Url.Parser exposing (parse)

import Shared
import Core.Constants exposing (coreConstants)
import Utils.Date exposing (parseTimestamp)

import Components.Article exposing (article)
import Components.Keywords exposing (keywords)

type alias Model = ()

type alias Msg = Never

type alias RouteParams = {}

type alias Data = ()

-- feature

-- getPostId : String -> String
-- getPostId =
--   String.split "/"
--     >> Array.fromList
--     >> Array.get 2
--     >> Maybe.withDefault ""

-- getPostSourceUrl : String -> String
-- getPostSourceUrl url =
--   let
--     postId = getPostId url
--   in
--     constants.postsSourceUrl ++ postId ++ "/" ++ postId ++ constants.postSourceExtension

-- getDiscussOnTwitterUrl : PostFeatureContent -> String
-- getDiscussOnTwitterUrl content =
--   let
--     baseUrl = "https://twitter.com/search?q=balov bohdan "
--     urlWithPostTitle = baseUrl ++ content.postMeta.title
--     urlEncoded = Url.percentDecode urlWithPostTitle
--   in
--     Maybe.withDefault "https://twitter.com/balov_bohdan" urlEncoded

-- parseKeywords : String -> List String
-- parseKeywords words =
--   words
--     |> String.split ","
--     |> List.map String.trim

-- getTimeToRead : PostFeatureContent -> String
-- getTimeToRead content =
--   let
--     koefficient = 0.0008
--     textLength = toFloat <| String.length <| content.post.text
--     timeToRead = String.fromInt <| ceiling <| (textLength * koefficient)
--   in
--     timeToRead ++ " mins to read"

-- header : Model -> PostFeatureContent -> Html Message
-- header model content =
--   let
--     publishedOnDirty = String.toInt content.postMeta.publishedOn
--     publishedOn =
--       case (publishedOnDirty) of
--         Nothing -> "unknown"
--         Just value -> parseTimestamp value
--   in
--     div
--       [ css
--           [ Css.displayFlex
--           , Css.property "gap" "5px"
--           , Css.fontSize <| Css.rem 0.8
--           ]
--       ]
--       [ span
--           [ css [ Css.color model.theme.textSecondary ] ]
--           [ text ("Published on " ++ publishedOn) ]
--       , span
--           [ css [ Css.color model.theme.textSecondary ] ]
--           [ text "•" ]
--       , span
--           [ css [ Css.color model.theme.textSecondary ] ]
--           [ text (getTimeToRead content) ]
--       ]

-- sourceButton : Model -> String -> String -> Html Message
-- sourceButton model url name =
--   a
--     [ href url
--     , target "__blank"
--     , css [ Css.color model.theme.accent ]
--     ]
--     [ text name ]

-- source : Model -> PostFeatureContent -> Html Message
-- source model content =
--   div
--     [ css
--         [ Css.displayFlex
--         , Css.flexWrap Css.wrap
--         , Css.property "gap" "10px"
--         ]
--     ]
--     [ sourceButton
--         model
--         (getDiscussOnTwitterUrl content)
--         "Discuss on Twitter"
--     , sourceButton
--         model
--         (getPostSourceUrl model.url.path)
--         "Open on GitHub"
--     ]

-- meta : Model -> PostFeatureContent -> Html Message
-- meta model content =
--   div
--     [ css
--         [ Css.displayFlex
--         , Css.property "gap" "40px"
--         , Css.flexDirection Css.column
--         , Css.alignItems Css.flexEnd
--         , Css.paddingBottom <| Css.px 10
--         , Css.boxSizing Css.borderBox
--         , Css.marginTop <| Css.px 40
--         ]
--     ]
--     [ source model content
--     , keywords
--         { model = model
--         , keywords = parseKeywords content.postMeta.keywords
--         }
--     ]

posts : Shared.Model -> Html Msg
posts sharedModel =
  div [] [ text "Posts" ]

-- meta

view : Maybe PageUrl -> Shared.Model -> Model -> StaticPayload Data RouteParams -> View Msg
view maybeUrl sharedModel templateModel static =
  { title = "Posts | Mr. Balov"
  , body = [ toUnstyled (posts sharedModel) ]
  }

data : DataSource Data
data = DataSource.succeed ()

head : StaticPayload Data RouteParams -> List Head.Tag
head static =
  Head.Seo.summary
    { canonicalUrlOverride = Nothing
    , siteName = "Mr. Balov"
    , description = "Post | Mr. Balov"
    , locale = Just "en"
    , title = "Post | Mr. Balov"
    , image =
        { url = Pages.Url.external (coreConstants.url ++ "assets/f1b-free-flight.jpg")
        , alt = "Post | Mr. Balov"
        , dimensions = Nothing
        , mimeType = Nothing
        }
    }
    |> Head.Seo.website

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
