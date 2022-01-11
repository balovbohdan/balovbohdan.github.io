module Codemirror exposing (codemirror)

import Html exposing (node, Html)
import Html.Attributes exposing (attribute)

type alias Config =
  { theme: String
  , mode: String
  , lineNumbers: Bool
  , lineWrapping: Bool
  , readOnly: String
  }

type alias Props =
  { value: String
  , config: Config
  }

boolToString : Bool -> String
boolToString bool = if bool then "True" else "False"

codemirror : Props -> Html message
codemirror props =
  node
    "codemirror-elm"
    [ attribute "value" props.value
    , attribute "theme" props.config.theme
    , attribute "mode" props.config.mode
    , attribute "lineNumbers" (boolToString props.config.lineNumbers)
    , attribute "lineWrapping" (boolToString props.config.lineWrapping)
    , attribute "readOnly" props.config.readOnly
    ]
    []
