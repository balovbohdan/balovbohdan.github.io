module Page.Posts.Post__ exposing (Data, Model, Msg, page)

import Css
import Array
import Url
import Path
import Head
import Head.Seo
import OptimizedDecoder
import Browser.Navigation
import Json.Encode
import Json.Decode
import Pages.Url
import Pages.Secrets
import DataSource.Http
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

import Model.PostMeta.Query exposing (queryPostMeta)

type alias Constants =
  { postMetaUrl: String
  , postUrl: String
  , postIds: List (Maybe String)
  }

type alias Model = ()

type alias Msg = Never

type alias RouteParams = { post: Maybe String }

type alias PostMeta = { name: String, content: String }

type alias Post = { name: String, content: String }

type alias Data =
  { post: Post
  , postMeta:
      { name: String
      , title: String
      , description: String
      , keywords: String
      , cover: String
      , publishedOn: String
      }
  }

constants : Constants
constants =
  { postMetaUrl = "https://api.github.com/repositories/408298184/contents/content/blog/metas/"
  , postUrl = "https://api.github.com/repositories/408298184/contents/content/blog/posts/"
  , postIds =
      [ Nothing
      , Just "medical-app-idea"
      , Just "why-you-need-to-care-about-your-health"
      , Just "why-you-need-to-care-about-your-health"
      , Just "what-you-need-to-know-about-the-ioc"
      ]
  }

-- feature

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

posts : Shared.Model -> StaticPayload Data RouteParams -> Html Msg
posts sharedModel static =
  div [] [ text "Posts" ]

-- meta

view : Maybe PageUrl -> Shared.Model -> StaticPayload Data RouteParams -> View Msg
view maybeUrl sharedModel static =
  { title = "Posts | Mr. Balov"
  , body = [ toUnstyled (posts sharedModel static) ]
  }

postDataDecoder: OptimizedDecoder.Decoder Post
postDataDecoder =
  OptimizedDecoder.map2
    Post
    (OptimizedDecoder.field "name" OptimizedDecoder.string)
    (OptimizedDecoder.field "content" OptimizedDecoder.string)

postData: RouteParams -> DataSource Post
postData routeParams =
  let
    postId = Maybe.withDefault "" routeParams.post
    url = constants.postUrl ++ postId ++ "/" ++ postId ++ ".md?ref=github-page"
  in
    DataSource.Http.request
      (Pages.Secrets.succeed
        (\tokenGithub ->
            { url = url
            , method = "GET"
            , headers = [("Authorization", tokenGithub)]
            , body = DataSource.Http.emptyBody
            }
        )
        |> Pages.Secrets.with "TOKEN_GITHUB"
        )
      postDataDecoder

data : RouteParams -> DataSource Data
data routeParams =
  DataSource.map2
    (\post postMeta -> { post = post, postMeta = postMeta })
    (postData routeParams)
    (queryPostMeta (Maybe.withDefault "" routeParams.post))

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

routes: DataSource.DataSource (List RouteParams)
routes = DataSource.succeed (List.map (\postId -> { post = postId }) constants.postIds)

page : Page RouteParams Data
page =
  let
    preRenderedPage = Page.prerender { head = head, data = data, routes = routes }
    noStatePage = preRenderedPage |> Page.buildNoState { view = view }
  in
    noStatePage
