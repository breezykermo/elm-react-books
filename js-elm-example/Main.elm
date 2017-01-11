module Main exposing (main)
import Html exposing (Html, div, label, input, text, br)
import Html.Events exposing (onInput)

main =
  Html.beginnerProgram
    { model = model
    , update = update
    , view = view
    }

type Profession
  = Student String
  --| Professor String
  | SoulSearcher

type alias Model =
  { name : String
  , job : Profession
  }

model : Model
model =
  { name = ""
  , job = SoulSearcher
  }

type Msg
  = NameChange String
  | JobChange Profession

update : Msg -> Model -> Model
update msg model =
  case msg of
    NameChange newContent ->
      { model | name = newContent }

    JobChange newJob ->
      { model | job = newJob }

view : Model -> Html Msg
view model =
  div []
  [ div []
    [ label [] [ text ("Name: " ++ model.name) ]
    , br [] []
    , input [ onInput NameChange ] []
    ]
  , div []
    [ label [] [ text ("Profession: " ++ (printProfession model.job)) ]
    , br [] []
    , input [ onInput jobChange ] []
    ]
  ]

jobChange : String -> Msg
jobChange newJob =
  if newJob == "" then JobChange SoulSearcher
  else JobChange (Student newJob)

printProfession : Profession -> String
printProfession job =
  case job of
    SoulSearcher -> "A soul searcher"
    Student prof -> "A student of " ++ prof