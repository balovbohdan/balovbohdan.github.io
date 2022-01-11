module Core.Route.Parsers exposing (postUrlParser)

import Url.Parser exposing ((</>), string, s, Parser)

postUrlParser : Parser (String -> a) a
postUrlParser = s "posts" </> string
