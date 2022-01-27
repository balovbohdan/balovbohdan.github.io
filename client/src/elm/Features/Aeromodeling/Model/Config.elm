module Features.Aeromodeling.Model.Config exposing (config)

type alias Step = { step: Int }
type alias Config = { steps: Int, description: Step }

config : Config
config =
  { steps = 1
  , description = { step = 0 }
  }
