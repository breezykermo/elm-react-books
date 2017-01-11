module Utils exposing (renderWiki, renderErr, isComplete, hr)

import Html exposing (Html, text)
import Html.Attributes exposing (href)
import Types exposing (Book)


renderWiki : Maybe String -> Html.Attribute msg
renderWiki wiki =
    case wiki of
        Just url ->
            href url

        Nothing ->
            href "/"


renderErr : Maybe String -> Html msg
renderErr err =
    case err of
        Just error ->
            text error

        Nothing ->
            text ""


isComplete : Book -> Bool
isComplete book =
    case book.end of
        Just _ ->
            True

        Nothing ->
            False


hr : Html msg
hr =
    Html.hr [] []
