module Core.Flags exposing (Flags)

type alias Flags =
  { colorSchema: String
  , env: { gitHub: { token: String } }
  }
