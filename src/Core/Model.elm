module Core.Model exposing (Model, PostPreview)

import Url
import Browser.Navigation

import Core.Theme exposing (Theme)

type alias PostPreview = String

type alias Posts =
  { content: List PostPreview
  , loading: Bool
  }

type alias Model =
  { key : Browser.Navigation.Key
  , url : Url.Url
  , colorSchema: String
  , theme: Theme
  , posts: Posts
  }
