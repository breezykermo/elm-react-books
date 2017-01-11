type node =
(* represent all elements through the single component expression (e.g., both
   framework-based components and HTML components). The structure is:
      ("name", [("class", "name"); ("attribute", "list")], [ Children(...) ])*)
  | Cmp of string * (string*string) list * node list
(* represents raw text in the JSX/HTML structure, but could encompass other
   raw values. *)
  | Raw of string


let craRep = Cmp("App", [("className", "App")], [
  Cmp("div", [("className", "App-header")], [
    Cmp("img", [("className", "App-logo"); ("alt", "logo")], []);
    Cmp("h2", [], [
      Raw("Welcome to React")
    ]);
    Cmp("p", [("className", "App-intro")], [
      Raw("To get started, edit ");
      Cmp("code", [], [
        Raw("src/App.js")
      ]);
      Raw(" and save to reload")
    ])
  ])
])

(*
This representation would be taken from that which is rendered in the DOM. The
issue here is that I need to represent dynamic values somehow, those values
that are interpolated with the component structure.
*)
