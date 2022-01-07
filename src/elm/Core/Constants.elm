module Core.Constants exposing (constants)

type alias Constants =
  { uiOpacityTransitionDuration: Int
  , toggleUiDelay: Int
  , internalLinkNavigationDelay: Int
  }

constants : Constants
constants =
  { uiOpacityTransitionDuration = 200
  , toggleUiDelay = 400
  , internalLinkNavigationDelay = 100
  }
