module Main exposing (..)

import Html exposing (Html, button, div, text)
import Html.App exposing (program)
import Html.Events exposing (onClick)

type alias Model =
  Int

init: ( Model, Cmd Msg )
init =
  ( 0, Cmd.none )

type Msg =
  Increment Int

view: Model -> Html Msg
view model =
  div []
      [button [onClick (Increment 2)] [text "+"]
      , text (toString model)
      ]

update: Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Increment howMuch -> ( model + howMuch, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

main : Program Never
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }