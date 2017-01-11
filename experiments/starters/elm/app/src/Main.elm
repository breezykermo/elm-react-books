module Main exposing (..)

import Html exposing (Html,div,text)
import Html.App exposing (program)
import Messages exposing (Msg)
import Models exposing (Model)
import Update exposing (update)
import View exposing (view)

init: (Model, Cmd Msg)
init =
  ("Hello", Cmd.none)

main: Program Never
main =
  program
  { init = init
  , view = view
  , update = update
  , subscriptions = (always Sub.none)
  }