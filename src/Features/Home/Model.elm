module Features.Home.Model exposing (queryHomeFeatureData)

import Http

import Core.Message exposing (Message(..))

queryHomeFeatureData : Cmd Message
queryHomeFeatureData =
  Http.get
    { url = "https://raw.githubusercontent.com/balovbohdan/personal-blog/main/content/blog/why-i-decided-to-drop-react.md"
    , expect = Http.expectString MessagePostsReceived
    }
