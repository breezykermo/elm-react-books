open Renderers
open Defs

let imp1rep = Component ("Layout", [
  Component ("Header", []);
  Component ("Panel", [
    Component ("Header", []);
    Html ("p", [
      Text "Here is the body"
    ]);
    Component ("Panel", []);
    Component ("Panel", [])
  ]);
  Component ("Footer", [])
])

module Imp1: RendererOptions =
  struct
    let folder_name = "imp1"
  end

module Rrend = ReactRedux(Imp1);;

Rrend.scaffold imp1rep
