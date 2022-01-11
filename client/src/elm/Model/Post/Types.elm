module Model.Post.Types exposing (Post, PostRaw)

type alias PostRaw = { name: String, content: String }

type alias Post = { name: String, text: String }
