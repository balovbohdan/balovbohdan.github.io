module Features.Author.Model.Config exposing (config)

type alias Step = { step: Int }
type alias Config = { steps: Int, authorBrief: Step }

config : Config
config =
  { steps = 1
  , authorBrief = { step = 0 }
  }
