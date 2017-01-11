(***************************)
(* Core Symbolic Structure *)
(***************************)
(* Component type is the first string, children represented by second in pair *)
type node =
  | Component of string * node list
(* represent all html tags as discrete building blocks, with no chacter,
   as we are only interested in the React components *)
  | Html of string * node list
(* represents raw text in the JSX/HTML structure *)
  | Text of string

let failwith msg = raise (Failure msg)

let fst (node: node): string = match node with
  | Component (name, _)
  | Html (name, _) -> name
  | Text str -> str (* NB: this functionality is maybe confusing? should possibly throw error *)

let children (node: node): node list = match node with
  | Component (_, kids)
  | Html (_, kids) -> kids
  | Text _ -> failwith "Text node has no children"
;;
