import Html exposing (..)
import Html.Attributes exposing (..)

main = Html.program {
  init = init,
  view = view,
  update = update,
  subscriptions = subscriptions
}

-- MODEL
type alias Model = {}

init : (Model, Cmd Msg)
init =
  ( Model, Cmd.none )

-- UPDATE
type Msg
  = On 
  | Off

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
