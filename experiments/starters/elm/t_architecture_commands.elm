-- Commands are how we tell the runtime to execute things that involve side effects.
-- That is, they are like Redux Thunk, in the sense that messages arrive at the model,
-- which can then issue commands (dispatch other actions in RR) to the store.
module Main exposing (..)

import Html exposing (Html, div, button, text)
import Html.App exposing (program)
import Html.Events exposing (onClick)
import Random

type alias Model =
  Int

init: (Model, Cmd Msg)
init =
  (1, Cmd.none)

-- two types of messages:
-- 'Roll' generates a new number
-- 'OnResult' returns the generated number
type Msg
  = Roll
  | OnResult Int

view: Model -> Html Msg
view model =
  div []
    [button [onClick Roll] [text "Roll"]
    , text (toString model)
    ]

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Roll ->
      -- Random.generate creates a command that will generate random numbers
      -- where the first argument is a constructor for the message that will be returned on result.
      (model, Random.generate OnResult (Random.int 1 6))
    OnResult res ->
      (res, Cmd.none)

main: Program Never
main =
  program
  { init = init
  , view = view
  , update = update
  , subscriptions = (always Sub.none)
  }