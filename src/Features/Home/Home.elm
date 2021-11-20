module Features.Home.Home exposing (home)

import Css
import Url
import Array
import Browser
import Html.Styled exposing (h2, div, text, Html)
import Html.Styled.Attributes exposing (css)

import Components.Card exposing (card)
import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))
import Model.PostMeta.Types exposing (PostMeta)
import Components.Button exposing (button)
import Features.Home.Constants exposing (constants)
import Features.Home.Model.Config exposing (config)
import Features.Home.Model.Query exposing (parseHomeFeatureContent)

post : Model -> PostMeta -> Html Message
post model postMeta =
  card
    { title = postMeta.title
    , description = postMeta.description
    , coverSrc = postMeta.cover
    , css = [ Css.marginBottom (Css.px 30) ]
    , to = "/#/post/" ++ (String.replace ".md" "" postMeta.name)
    , theme = model.theme
    }

posts : Model -> Html Message
posts model =
  let
    content = parseHomeFeatureContent model.featureData.content
  in
    div
      [ css
          [ Css.displayFlex
          , Css.flexWrap Css.wrap
          , Css.justifyContent Css.spaceBetween
          , Css.margin2 Css.zero Css.auto
          , Css.maxWidth (Css.px 1000)
          ]
      ]
      ( List.map (post model) content )

loadMoreButton : Model -> Html Message
loadMoreButton model =
  button
    { text = "Go to blog"
    , model = model
    , onClick = MessageLinkClicked (Browser.External "/#/blog")
    }

getShouldShowLoadMoreButton : Model -> Bool
getShouldShowLoadMoreButton model =
  let
    metaNamesIndex = config.metaNames.step
    -- postsAmount = Maybe.withDefault (List.singleton) (Array.get metaNamesIndex model.featureData.content)
  in
    False

home : Model -> Html Message
home model =
  div
    []
    [ h2 [ css [ Css.marginBottom <| Css.px 50 ] ] [ text "Some blog posts..." ]
    , posts model
    , div
      [ css
          [ Css.displayFlex, Css.justifyContent Css.center, Css.marginTop <| Css.px 30 ]
      ]
      [ if (getShouldShowLoadMoreButton model) then loadMoreButton model else (div [] []) ]
    ]
