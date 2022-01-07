module Core.FeatureData.FeatureData exposing (defaultFeatureData, FeatureContent, FeatureData)

import Array exposing (Array)

type alias FeatureContent = String

type alias FeatureData =
  { content: Array String
  , loading: Bool
  , shouldShowUi: Bool
  , step: Int
  }

defaultFeatureData : FeatureData
defaultFeatureData = { content = Array.empty, loading = False, shouldShowUi = False, step = 0 }
