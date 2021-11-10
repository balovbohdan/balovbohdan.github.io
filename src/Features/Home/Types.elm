module Features.Home.Types exposing (Post, PostMeta, PostMetaListItem, HomeFeatureContent)

type alias PostMeta = { title: String, description: String, keywords: String, cover: String }

type alias Post = { name: String, meta: PostMeta }

type alias PostMetaListItem = { name: String }

type alias HomeFeatureContent = List Post
