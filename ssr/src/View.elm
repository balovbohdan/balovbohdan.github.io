module View exposing (View, map, placeholder)

import Html exposing (Html)

type alias View message =
  { title : String
  , body : List (Html message)
  }

map : (message1 -> message2) -> View message1 -> View message2
map fn doc =
  { title = doc.title
  , body = List.map (Html.map fn) doc.body
  }

placeholder : String -> View msg
placeholder moduleName =
  { title = "Placeholder - " ++ moduleName
  , body = [ Html.text moduleName ]
  }
