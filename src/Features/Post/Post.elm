module Features.Post.Post exposing (post)

import Html.Styled exposing (div, text, Html)
import Url.Parser exposing ((</>), parse)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message)
import Core.Route.Parsers exposing (postUrlParser)
import Components.Article exposing (article)
import Features.Post.Model.Query exposing (parsePostFeatureContent)

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
          [ article { model = model, content = content.post.text } ]
