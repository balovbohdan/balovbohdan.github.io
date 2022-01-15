port module Ports exposing (localStorageOutcomePort, metaChangePort, scrollToPort)

import Array

port localStorageOutcomePort : String -> Cmd message

port metaChangePort : Array.Array String -> Cmd message

port scrollToPort : Int -> Cmd message
