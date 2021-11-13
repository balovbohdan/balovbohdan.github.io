module Model.Post.Config exposing (config)

type alias Config = { url: String, urlPostfix: String }

config : Config
config =
  { url = "https://api.github.com/repos/balovbohdan/mr-balov-blog/contents/docs/content/blog/posts/"
  , urlPostfix = "/text.md"
  }
