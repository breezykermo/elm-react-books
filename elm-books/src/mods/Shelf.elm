module Components.Shelf exposing (shelf)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Utils exposing (renderWiki)


shelfDisplay : Book -> Html msg
shelfDisplay book =
    let
        link =
            renderWiki book.wiki
    in
        a [ link, class "shelf-book", target "_blank" ]
            [ div [ class "author" ] [ text book.author ]
            , div [ class "title" ] [ text book.title ]
            ]


shelf : List Book -> Html msg
shelf books =
    div [ class "container shelf-case" ]
        (List.map shelfDisplay books)
