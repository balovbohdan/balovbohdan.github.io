module Core.FeatureData.FeatureData exposing (FeatureContent, FeatureData)

import Array exposing (Array)

type alias FeatureContent = String

type alias FeatureData =
  { content: Array String
  , loading: Bool
  , step: Int
  }
