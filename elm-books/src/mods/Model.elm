module Example exposing (..)


init : ( Model, Cmd Msg )
init =
    ( { currentBooks = []
      , completedBooks = []
      , error = Nothing
      , loading = True
      }
    , Cmd.none
    )


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
