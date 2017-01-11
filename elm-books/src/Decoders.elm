module Decoders exposing (bookDecoder, shelfDecoder)

import Types exposing (Book, Shelf)
import Json.Decode exposing (list, int, string, float, nullable, Decoder)
import Json.Decode.Pipeline exposing (decode, required)


-- dateDecoder : Decoder Date


bookDecoder : Decoder Book
bookDecoder =
    decode Book
        |> required "title" string
        |> required "author" string
        |> required "wiki" (nullable string)
        |> required "progress" float
        |> required "start" string
        |> required "end" (nullable string)


shelfDecoder : Decoder Shelf
shelfDecoder =
    decode Shelf
        |> required "shelf" (list bookDecoder)
