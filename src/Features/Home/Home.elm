module Features.Home.Home exposing (home)

import Css
import Html.Styled exposing (div, Html)
import Html.Styled.Attributes exposing (css)

import Components.Card exposing (card)
import Core.Model.Types exposing (Model)
import Core.Message exposing (Message)
import Features.Home.Model.Query exposing (parseHomeFeatureContent)
import Model.PostMeta.Types exposing (PostMeta)

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

home : Model -> Html Message
home model = posts model
