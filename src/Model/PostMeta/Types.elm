module Model.PostMeta.Types exposing (PostMeta, PostMetaRaw)

type alias PostMetaRaw = { name: String, content: String }

type alias PostMeta = { name: String, title: String, description: String, keywords: String, cover: String }
