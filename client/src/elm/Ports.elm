port module Ports exposing (localStorageOutcomePort, metaChangePort)

import Array

port localStorageOutcomePort : String -> Cmd message

port metaChangePort : Array.Array String -> Cmd message
