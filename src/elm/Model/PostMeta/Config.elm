module Model.PostMeta.Config exposing (config)

type alias Config = { url: String, parameters: String }

config : Config
config = {
  url = "https://api.github.com/repos/balovbohdan/mr-balov-blog/contents/content/blog/metas/"
  , parameters = "?ref=github-page"
}
