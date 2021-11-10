module Features.Home.Config exposing (config)

type alias Step = { step: Int, url: String }
type alias Config ={ steps: Int, metas: Step, meta: Step }

config : Config
config =
  { steps = 2
  , metas =
      { step = 0
      , url = "https://api.github.com/repos/balovbohdan/mr-balov-blog/contents/docs/content/blog/metas"
      }
  , meta =
      { step = 1
      , url = "https://api.github.com/repos/balovbohdan/mr-balov-blog/contents/docs/content/blog/metas/"
      }
  }
