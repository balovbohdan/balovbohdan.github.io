module Model.PostMeta.Constants exposing (constants)

type alias Constants = { postMetaUrl: String }

constants : Constants
constants =
  { postMetaUrl = "https://api.github.com/repositories/408298184/contents/content/blog/metas/"
  }
