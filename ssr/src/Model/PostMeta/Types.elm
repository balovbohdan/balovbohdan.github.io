module Model.PostMeta.Types exposing (PostMeta, PostMetaRaw, PostMetaContent)

type alias PostMetaRaw = { name: String, content: String }

type alias PostMetaContent =
  { title: String
  , description: String
  , keywords: String
  , cover: String
  , publishedOn: String
  }

type alias PostMeta =
  { name: String
  , content: PostMetaContent
  }
