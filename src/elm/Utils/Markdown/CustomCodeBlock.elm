module Utils.Markdown.CustomCodeBlock exposing (customCodeBlock)

import Html exposing (node, Html)
import Html.Attributes exposing (attribute)
import Core.Message exposing (Message)
-- import Markdown.Block exposing (Block(..))
import Codemirror exposing (codemirror)
import Markdown.Block exposing (CodeBlock(..))

type alias Props =
  { value: String
  , meta: Markdown.Block.CodeBlock
  }

adjustMode : String -> String
adjustMode mode =
  case mode of
    "js" -> "javascript"
    _ -> mode

getMode : Markdown.Block.CodeBlock -> String
getMode meta =
  case meta of
    Indented -> ""
    Fenced _ fence ->
      adjustMode (Maybe.withDefault "" fence.language)

customCodeBlock : Props -> Html Message
customCodeBlock props =
  codemirror
    { value = props.value
    , config =
        { theme = "material"
        , mode = getMode props.meta
        , lineNumbers = False
        , lineWrapping = True
        }
    }