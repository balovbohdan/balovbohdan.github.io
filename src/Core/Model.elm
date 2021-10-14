module Core.Model exposing (Model)

import Url
import Browser.Navigation

import Core.Theme exposing (Theme)
import Core.FeatureData.FeatureData exposing (FeatureData)

type alias Model =
  { key : Browser.Navigation.Key
  , url : Url.Url
  , colorSchema: String
  , theme: Theme
  , featureData: FeatureData
  }
