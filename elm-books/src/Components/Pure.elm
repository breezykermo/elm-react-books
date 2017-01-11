module Components.Pure exposing (desk, shelf, loading)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Utils exposing (renderWiki)


loading : Html msg
loading =
    div [ class "fullscreen" ]
        [ div [ class "loader" ] []
        ]


shelfDisplay : Book -> Html msg
shelfDisplay book =
    -- need a better non-link CSS option for wiki
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


progressBar : Float -> Html msg
progressBar amt =
    div [ class "progress-bar meter purple nostripes" ]
        [ span [ style [ ( "width", (toString (amt * 100)) ++ "%" ) ] ] []
        ]


deskDisplay : Book -> Html msg
deskDisplay book =
    let
        url =
            case book.wiki of
                Just url ->
                    url

                Nothing ->
                    ""
    in
        a [ href url, class "desk-book", target "_blank" ]
            [ div [ class "details" ]
                [ div [ class "title" ] [ text book.title ]
                , div [ class "author" ] [ text book.author ]
                ]
            , progressBar book.progress
            ]


desk : List Book -> Html msg
desk books =
    div [ class "container desk-case" ]
        (List.map deskDisplay books)
