-- exports the 'main' module from this file
module Hello exposing (..)

-- import imports the module as object 'Html'
-- 'exposing' further populates the file namespace with specified attributes.
-- import Module exposing (..), imports all attributes in a module
import Html exposing (text)
-- many modules export a type that is the same as their module name (but not Html, it seems)

-- partial application possible
add: Int -> Int -> Int
add x y = x + y

multiply: Int -> Int -> Int
multiply x y = x * y

add3 = add 3
multiply64 = multiply 64

-- piping built in
pipe_example = 3
  |> multiply 2
  |> add 1

-- Union types used for many things, as in Ocaml
type Answer a = Yes | No | Other a
-- type aliases allow more flexibilty within type checker
type alias Response = Answer
-- especially with records
type alias Person = { id : Int, name : String}
label: Person -> String
label p = p.name
-- type aliases can also be used as contructor functions
sam = Person 0 "Sam"

respond: Answer Int -> String
respond ans =
  case ans of
    Yes -> "Yes"
    No -> "No"
    Other a -> case a of
      1 -> "Yes"
      _ -> "No"

main =
  text "Hello"