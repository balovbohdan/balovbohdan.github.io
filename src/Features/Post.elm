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
  <img src='/assets/post-cover.jpg' />
  <a href="https://unsplash.com/photos/5Fxuo7x-eyg" class="caption">Unsplash</a>
  <h1>Why I decided to learn Elm and drop React</h1>
  <p>Hola! I want to be honest: I’m really bored with React and its ecosystem. How many times a day do you see an “Uncaught TypeError: Cannot read property of undefined” error? Have you ever thought that there are better ways of writing code that doesn’t crash in production? This is the topic I’ve been exploring for near a year, and here are my explorations.</p>
  <h2>Ramda</h2>
  <p>It started for me from the Ramda. It is a nice JavaScript library with a lot of useful functions. This allows, and sometimes even enforces you to write composable code. This is when you develop independent pieces of code, and then compose them using the “compose” function to produce a valuable result.</p>
  <p>I’m still using this lib on an everyday basis. And I recommend it for you if you want to start writing composable software. Surely, it is not an ideal solution, and there are problems like understanding complex code compositions and sometimes even performance.</p>
  <p>So, I didn’t solve the core problem — “Cannot read property of undefined”. This is because we need a good solution to make code static analyses. And here I decided to go to the next step…</p>
  <h2>TypeScript</h2>
  <p>Yeah, it is on the hype. There are a lot of talks and articles around it. And it is really a nice thing to write more safe and even self-descriptive code. This looks much better compared to using Ramda with pure JavaScript: type annotations, interfaces, and even static code analyses!</p>
  <p>This is what I wanted — to check code in compile-time and find possible issues before it goes to production. It solves this problem rather well: you can find type mismatches. But to prevent runtime crashes you need to go deeper and follow good practices:</p>
  <ul><li>work properly with object modifications</li><li>follow the totality principle</li><li>use “Maybe” and “Either” monads</li></ul>
  <p>The first point looks straightforward — make a shallow copy before object modification. But what about the other two <a href=google.com>ones</a>?</p>
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
