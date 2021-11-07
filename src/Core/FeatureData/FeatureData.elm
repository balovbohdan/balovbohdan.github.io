module Core.FeatureData.FeatureData exposing (FeatureContent, FeatureData)

type alias FeatureContent = String

type alias FeatureData =
  { content: FeatureContent
  , loading: Bool
  , isCompleteData: Bool
  , step: Int
  , stepAccumulator: List String
  }
