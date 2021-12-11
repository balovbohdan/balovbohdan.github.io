module Features.Post.Model.Types exposing (PostFeatureContent)

import Model.Post.Types exposing (Post)
import Model.PostMeta.Types exposing (PostMeta)

type alias PostFeatureContent = { post: Post, postMeta: PostMeta }
