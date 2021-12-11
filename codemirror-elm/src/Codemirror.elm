module Codemirror exposing (codemirror)

import Html exposing (node, Html)

-- import Native.CodeMirror

-- type alias Config =
--   { value : String
--   , cmConfig : CmConfig
--   }

-- type alias CmConfig =
--   { theme : String
--   , mode : String
--   , height : String
--   , lineNumbers : Bool
--   , lineWrapping : Bool
--   }

-- codeMirrorNative : Config -> (String -> Signal.Message) -> Html
-- codeMirrorNative =
--   Native.CodeMirror.codeMirror

codemirror : CmConfig -> (String -> Signal.Message) -> String -> Html
codemirror config msgCreator code = node "codemirror-elm" [] []
