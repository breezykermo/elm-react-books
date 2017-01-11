-- RR = React/Redux architecture
module App exposing (..)

import Html exposing (Html, div, text)
import Html.App exposing (program)

-- Model
type alias Model =
  String

-- 'init' provides the initial input for the application
-- Html.program expects a tuple with (model, command), where command is the same as action in RR
init: ( Model, Cmd Msg )
init =
  ( "Hello", Cmd.none )

-- Messages
-- sort of represents props in RR, and the 'connect' function.
-- The view updates through Msgs.
type Msg =
  NoOp

-- View
view: Model -> Html Msg
view model =
  div []
    [ text model ]

-- Update
-- called by Html.program each time a Msg is received
update: Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp -> ( model, Cmd.none )

-- Subscriptions
-- monitor external input in the program, such as mouse movements, keyboard events, etc.
subscriptions: Model -> Sub Msg
subscriptions model =
  Sub.none

-- Main
-- wires everything together.
main: Program Never
main = program
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }