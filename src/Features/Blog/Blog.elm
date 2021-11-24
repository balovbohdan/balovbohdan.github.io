module Features.Blog.Blog exposing (blog)

import Css
import Html.Styled exposing (div, Html)
import Html.Styled.Attributes exposing (css)

import Components.Card exposing (card)
import Core.Model.Types exposing (Model)
import Core.Message exposing (Message)
import Model.PostMeta.Types exposing (PostMeta)
import Features.Blog.Model.Query exposing (parsePostsFeatureContent)

post : Model -> PostMeta -> Html Message
post model postMeta =
  card
    { title = postMeta.title
    , description = postMeta.description
    , coverSrc = postMeta.cover
    , css = [ Css.marginBottom (Css.px 30) ]
    , to = "/#/posts/" ++ (String.replace ".md" "" postMeta.name)
    , theme = model.theme
    }

posts : Model -> Html Message
posts model =
  let
    content = parsePostsFeatureContent model.featureData.content
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

blog : Model -> Html Message
blog model = posts model
