module Model.Post.Constants exposing (constants)

type alias Constants = { postUrl: String }

constants : Constants
constants =
  { postUrl = "https://api.github.com/repositories/408298184/contents/content/blog/posts/"
  }
