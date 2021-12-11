module Model.PostMetaItems.Config exposing (config)

type alias Config = { url: String }

config : Config
config = { url = "https://api.github.com/repos/balovbohdan/mr-balov-blog/contents/dist/content/blog/metas" }
