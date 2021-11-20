module Features.Post.Post exposing (post)

import Css
import Array
import Html.Styled.Attributes exposing (href, target)
import Html.Styled.Attributes exposing (css)
import Html.Styled exposing (a, div, text, Html)
import Url.Parser exposing ((</>), parse)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message)
import Core.Route.Parsers exposing (postUrlParser)
import Components.Article exposing (article)
import Features.Post.Model.Query exposing (parsePostFeatureContent)
import Features.Post.Constants exposing (constants)

getPostId : String -> String
getPostId =
  String.split "/"
    >> Array.fromList
    >> Array.get 2
    >> Maybe.withDefault ""

getPostSourceUrl : String -> String
getPostSourceUrl url =
  let
    postId = getPostId url
  in
    constants.postsSourceUrl ++ postId ++ "/" ++ postId ++ constants.postSourceExtension

source : Model -> Html Message
source model =
  a
    [ href (getPostSourceUrl model.url.path)
    , target "__blank"
    , css [ Css.color model.theme.accent ]
    ]
    [ text "Open on GitHub" ]

meta : Model -> Html Message
meta model =
  div
    [ css [ Css.textAlign Css.right ] ]
    [ source model ]

post : Model -> Html Message
post model =
  let
    postId = parse postUrlParser model.url
  in
    if postId == Nothing then
      text "This post doesn't exist... :("
    else
      let
        content = parsePostFeatureContent model.featureData.content
      in
        div
          []
          [ article { model = model, content = content.post.text, meta = meta model } ]
