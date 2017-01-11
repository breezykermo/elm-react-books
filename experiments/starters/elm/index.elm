import Html exposing (..)
import Html.Attributes exposing (..)
--import List exposing (length, map)
import Html.App exposing (beginnerProgram)

main =
  beginnerProgram { model=model, update=update, view=view }

type alias Model = String

model: Model
model = ""

type Msg =
  Change String

update: Msg -> Model -> Model
update msg model =
  case msg of 
    Change string -> string

-- VIEWS 

-- Header, props = className:String, title:String
type alias HeaderProps = { className: String, title: String }
header: HeaderProps -> Html Msg
header props =
  div [class props.className] [
    img [src "logo.svg",class "App-logo", alt "logo"] [],
    h2 [] [text props.title]
  ]

-- List, props = title:String, items:List String
type alias ListProps = { title: String, items: List String }
list: ListProps -> Html Msg
list props =
  div [class "list-container"] [
    if props.title /= "" then
      h4 [class "list-title"] [text props.title]
    else text "",
    if List.length props.items > 0 then
      ul [] (List.map (\item -> li [] [text item]) props.items)
    else text ""]

-- FancyBox, props = color:String, features: List String
type alias FancyBoxProps = { color: String, features: List String }
fancyBox: FancyBoxProps -> Html Msg
fancyBox props =
  div [class "box-container", style [("border-color", props.color)]] [
    h2 [] [text "Fancy Box"],
    p [] [text "Welcome to a component-hierarchised application"],
    list { title="Features", items=props.features}]


-- Note css is loaded in through here as well
css : String -> Html Msg
css path =
  node "link" [ rel "stylesheet", href path ] []

view: Model -> Html Msg
view model = div [] [
  css "style.css",
  header { title="Welcome", className="App-header"},
  p [class "App-intro"] [text "
    Those who need to see in order to know or believe, draw and paint 
    and fix the lake of changing, ocellated skin and make the purely 
    tactile visible by means of colours and shapes. But every epidermis 
    would require a different ",
    code [] [text "tattoo"],
    text "; it would have to evolve with time: each
     face requires an original tactile mask."],
  div [class "centered-div"] [fancyBox {
    color="red",
    features=["Component inference", "Cross-framework scaffolding"]
  }]]
