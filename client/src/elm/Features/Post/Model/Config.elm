module Features.Post.Model.Config exposing (config)

type alias Step = { step: Int }
type alias Config = { steps: Int, post: Step, postMeta: Step }

config : Config
config =
  { steps = 2
  , post = { step = 0 }
  , postMeta = { step = 1 }
  }
