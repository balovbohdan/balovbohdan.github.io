module Features.Home.Model.Config exposing (config)

type alias Step = { step: Int }
type alias Config = { steps: Int, metaNames: Step, meta: Step }

config : Config
config =
  { steps = 2
  , metaNames = { step = 0 }
  , meta = { step = 1 }
  }
