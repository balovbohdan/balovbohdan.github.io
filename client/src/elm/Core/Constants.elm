module Core.Constants exposing (constants)

type alias Constants =
  { uiOpacityTransitionDuration: Int
  , toggleUiDelay: Int
  , internalLinkNavigationDelay: Int
  , uiOpacityTransitionDelay: Int
  }

constants : Constants
constants =
  { uiOpacityTransitionDuration = 150
  , toggleUiDelay = 50
  , internalLinkNavigationDelay = 50
  , uiOpacityTransitionDelay = 30
  }
