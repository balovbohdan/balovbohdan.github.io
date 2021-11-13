module Core.Utils.PageTitle exposing (getPageTitle)

import Core.Model.Types exposing (Model)

getPageTitle : Model -> String
getPageTitle model =
  case model.url.path of
    "/" -> "Bohdan Balov | Personal Blog"
    "/post" -> "Awesome Post | Bohdan Balov"
    _ -> "Bohdan Balov | Personal Blog"
