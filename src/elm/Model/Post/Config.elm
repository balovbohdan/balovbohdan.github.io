module Model.Post.Config exposing (config)

type alias Config = { url: String, extension: String, parameters: String }

config : Config
config =
  { url = "https://api.github.com/repos/balovbohdan/mr-balov-blog/contents/content/blog/posts/"
  , extension = ".md"
  , parameters = "?ref=github-page"
  }
