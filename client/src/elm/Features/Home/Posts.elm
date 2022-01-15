module Features.Home.Posts exposing (posts)

import Css
import Html.Styled exposing (div, Html)
import Html.Styled.Attributes exposing (css)

import Components.Card exposing (card)
import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))
import Model.PostMeta.Types exposing (PostMeta)
import Components.Button exposing (button)
import Features.Home.Constants exposing (constants)
import Components.PageSection exposing (pageSection)
import Features.Home.Model.Query exposing (parseHomeFeatureContent)

getShouldShowGoToBlogButton : List PostMeta -> Bool
getShouldShowGoToBlogButton content = List.length content > constants.blogPostsLimit

goToBlogButton : Model -> Html Message
goToBlogButton model =
  button
    { text = "Go to blog"
    , model = model
    , to = Just "/#/blog"
    , onClick = Nothing
    }

footer : Model -> List PostMeta -> Html Message
footer model content =
  let
    shouldShowGoToBlogButton = getShouldShowGoToBlogButton content
  in
    if (shouldShowGoToBlogButton) then
      goToBlogButton model
    else
      div [] []

postTile : Model -> PostMeta -> Html Message
postTile model postMeta =
  card
    { title = postMeta.title
    , description = postMeta.description
    , coverSrc = postMeta.cover
    , css = [ Css.marginBottom (Css.px 30) ]
    , to = "/#/posts/" ++ (String.replace ".md" "" postMeta.name)
    , theme = model.theme
    }

postTiles : Model -> List PostMeta -> Html Message
postTiles model limitedContent =
  div
    [ css
        [ Css.displayFlex
        , Css.flexWrap Css.wrap
        , Css.justifyContent Css.spaceBetween
        , Css.margin2 Css.zero Css.auto
        , Css.maxWidth (Css.px 1000)
        ]
    ]
    ( List.map (postTile model) limitedContent )

posts : Model -> Html Message
posts model =
  let
    content = parseHomeFeatureContent model.featureData.content
    limitedContent = List.take constants.blogPostsLimit content
  in
    pageSection
      { model = model
      , title = "Some blog posts..."
      , body = postTiles model limitedContent
      , footer = Just (footer model content)
      }
