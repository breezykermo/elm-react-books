module Main exposing (..)

import Html exposing (Html)
import Html.App exposing (map, program)
import Widget

-- parent model composes component models
type alias AppModel =
  { widgetModel : Widget.Model
  }

initialModel: AppModel
initialModel =
  { widgetModel = Widget.initialModel
  }

init: ( AppModel, Cmd Msg )
init = ( initialModel, Cmd.none )

-- Msg is sent to the appropriate component through
-- type checking/deconstruction.
type Msg
  = WidgetMsg Widget.Msg

view: AppModel -> Html Msg
view model =
  Html.div []
-- Html.map sends messages of type arg1 to the view arg2 (constructed by widgetModel)
    [map WidgetMsg (Widget.view model.widgetModel)
    ]

update: Msg -> AppModel -> (AppModel, Cmd Msg)
update message model =
  case message of
    WidgetMsg msg ->
      let (updatedWidgetModel, widgetCmd) = Widget.update msg model.widgetModel in
      -- Cmd.map does the same forwarding as Html.map, for commands
      ({model | widgetModel = updatedWidgetModel}, Cmd.map WidgetMsg widgetCmd)

subscriptions : AppModel -> Sub Msg
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