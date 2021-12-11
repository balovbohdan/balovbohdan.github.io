module Model.Post.Config exposing (config)

type alias Config = { url: String, extension: String }

config : Config
config =
  { url = "https://api.github.com/repos/balovbohdan/mr-balov-blog/contents/dist/content/blog/posts/"
  , extension = ".md"
  }
