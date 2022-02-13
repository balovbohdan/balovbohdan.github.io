module Core.Flags exposing (Flags, decodeFlags)

import Json.Decode

import Pages.Flags exposing (Flags(..))

type alias Flags = { colorSchema: String }

defaultFlags : Flags
defaultFlags = { colorSchema = "light" }

decoder : Json.Decode.Decoder Flags
decoder = Json.Decode.map Flags (Json.Decode.field "colorSchema" Json.Decode.string)

decodeFlags : Pages.Flags.Flags -> Flags
decodeFlags flags =
  case flags of
    BrowserFlags value ->
      case (Json.Decode.decodeValue decoder value) of
        Result.Ok decodedFlags -> decodedFlags
        _ -> defaultFlags
    _ -> defaultFlags
