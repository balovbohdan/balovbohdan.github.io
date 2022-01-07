module Core.FeatureData.FeatureData exposing (defaultFeatureData, FeatureContent, FeatureData)

import Array exposing (Array)

type alias FeatureContent = String

type alias FeatureData =
  { content: Array String
  , loading: Bool
  , visibleUi: Bool
  , step: Int
  }

defaultFeatureData : FeatureData
defaultFeatureData = { content = Array.empty, loading = False, visibleUi = False, step = 0 }
