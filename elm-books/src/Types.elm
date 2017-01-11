module Types exposing (Date, Shelf, Book, Model)

import Http


type alias Date =
    { month : Int
    , day : Int
    , year : Int
    }


type alias Book =
    { title : String
    , author : String
    , wiki : Maybe String
    , progress : Float
    , start : String
    , end : Maybe String
    }


type alias Shelf =
    { shelf : List Book
    }


type alias Model =
    { currentBooks : List Book
    , completedBooks : List Book
    , error : Maybe String
    , loading : Bool
    }
