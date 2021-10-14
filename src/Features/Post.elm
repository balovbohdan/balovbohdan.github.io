module Features.Post exposing (post)

import Html.Styled exposing (div, text, Html)
import Url.Parser exposing ((</>), parse)

import Core.Model exposing (Model)
import Core.Message exposing (Message)
import Core.Route.Parsers exposing (postUrlParser)
import Components.Article exposing (article)

articleContent : String
articleContent =
  """
  # Why I decided to learn Elm and drop React
  ## About Ramda, Haskell, TypeScript, and Elm
  ![Tux, the Linux mascot](https://github.com/balovbohdan/personal-blog/blob/main/dist/assets/post-cover.jpg?raw=true)
  [<center>*Unsplash*</center>](https://unsplash.com/photos/5Fxuo7x-eyg)
  Hola! I want to be honest: I’m really bored with React and its ecosystem. How many times a day do you see an “Uncaught TypeError: Cannot read property of undefined” error? Have you ever thought that there are better ways of writing code that doesn’t crash in production? This is the topic I’ve been exploring for near a year, and here are my explorations.
  """

post : Model -> Html Message
post model =
  let
    postId = parse postUrlParser model.url
  in
    if postId == Nothing then
      text "This post doesn't exist... :("
    else
      div
        []
        [ article { model = model, content = articleContent } ]
