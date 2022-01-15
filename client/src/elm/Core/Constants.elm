module Core.Constants exposing (constants)

type alias Constants =
  { uiOpacityTransitionDuration: Int
  , toggleUiDelay: Int
  , internalLinkNavigationDelay: Int
  }

constants : Constants
constants =
  { uiOpacityTransitionDuration = 100
  , toggleUiDelay = 50
  , internalLinkNavigationDelay = 50
  }
