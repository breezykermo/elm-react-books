module Main exposing (..)

import Html exposing (Html, div, text, h1)
import Html.Attributes exposing (class, href, src, property)
import Types exposing (..)
import Components.Pure exposing (desk, shelf, loading)
import Utils exposing (renderErr, isComplete, hr)
import Decoders exposing (shelfDecoder)
import Http


-- MODEL


init : ( Model, Cmd Msg )
init =
    ( { currentBooks = []
      , completedBooks = []
      , error = Nothing
      , loading = True
      }
    , getLachieShelf
    )



-- UPDATE


type Msg
    = NewShelf (Result Http.Error Shelf)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewShelf (Ok data) ->
            ( { model
                | completedBooks = List.filter isComplete data.shelf
                , currentBooks =
                    List.filter (\b -> not (isComplete b)) data.shelf
                , loading = False
              }
            , Cmd.none
            )

        NewShelf (Err _) ->
            ( { model
                | error = Just "Something went wrong!"
                , loading = False
              }
            , Cmd.none
            )



-- ASYNC


srcUrl : String
srcUrl =
    "https://raw.githubusercontent.com/breezykermo/LachieKermode/master/Books/shelf.json"


getLachieShelf : Cmd Msg
getLachieShelf =
    Http.send NewShelf <|
        Http.get srcUrl shelfDecoder



-- VIEW


view : Model -> Html Msg
view model =
    if model.loading then
        loading
    else
        div [ class "app-case" ]
            [ h1 [ class "app-title" ] [ text "Digital Library" ]
            , hr
            , desk model.currentBooks
            , hr
            , shelf model.completedBooks
            , renderErr model.error
            ]



-- SUBSCRIPTIONS
-- Not sure how to simulate these in React-Redux. Perhaps
-- through rx-js?


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
