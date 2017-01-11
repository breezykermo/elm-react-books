open Defs
open Renderers

(* Hard code syntax representation as array to begin with [] *)
let egRep = Component ("Layout", [
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

let rec create_rep (rep:string) = failwith "unimplemented"

let rec parse (node: node): string =
  match node with
  | Component (name, children) (* fall-through semantics *)
  | Html (name, children) ->
    (let open_tag = "<"^name^">" in
    let close_tag = "</"^name^">\n" in
    let empty_tag = "<"^name^"/>\n" in
    match children with
    | [] -> empty_tag
    | arr -> open_tag^(String.concat "" (List.map parse arr))^close_tag)
  | Text x -> x

(* let unique_cmps (nd: node): node list =
  let find (node: node) (cmps: string list): string list =
    match node with
    | Component (name, children) -> []
    | Html (_, _) -> cmps
    | Text _ -> cmps *)
let rec print_list = function
  | [] -> ()
  | e::l -> print_string e ; print_string " " ; print_list l
(* I was confused due to the argument order of fold_left; I accidently
   type asserted that 'a should be a node by confusing the args for a long
   time, when implementing the reduce function below. *)
let fold = fun x y z -> List.fold_right x z y

(* Functional iterators for imp1. NB: The iterating function here is only
   applied to a string (the Component name), as there is no other info
   contained in the node at this point. *)
let rec map (convert_name: string -> string)
            (convert_node: (string * node list) -> string)
            (convert_html: (string * node list) -> string)
            (node: node)
      : node = failwith "unimplemented"
  (* match node with
  | Component (name, children) -> Component(f name, List.map (map f) children)
  | Html (name, children) -> Html(f name, List.map (map f) children)
  | Text x -> Text(f x) *)

(* NB: This is a depth-first reduce, using currying (need to check
   if I am thinking about this correctly with Dave) *)
let rec reduce_names (f: string -> 'a -> 'a) (acc: 'a) (node: node): 'a =
  match node with
  | Component (parent, children) ->
    fold (fun child pr -> reduce_names f pr child) (f parent acc) children
  | Html (parent, children) ->
    fold (fun child pr -> reduce_names f pr child) acc children
  | Text x -> acc

let unique_cmps (n: node): string list =
  reduce_names (fun s seen -> if List.mem s seen then seen else s::seen) [] n

let componentize (name:string): string =
"import React from 'react'

const "^name^" = (props) => (
  <div>This is a "^name^" component.</div>
)

export default "^name


let scaffold (n: node) (folder: string): unit =
  (* let dir_path = "./"^folder in
  try
    Unix.mkdir dir_path 0o640
  with
    e -> match e with
    | Unix.Unix_error(t, a1, a2) ->
      if t = Unix.EEXIST then ()
      else raise e; *)
  let create_file (name: string): unit =
    let message = componentize name in
    let file_path = name^".jsx" in
    let oc = open_out ("__"^file_path) in    (* create or truncate file, return channel *)
      Printf.fprintf oc "%s\n" message;   (* write something *)
    close_out oc;                (* flush and close the channel *)
  in
  List.iter create_file (unique_cmps n);


print_string "starting...\n";;
scaffold egRep "imp1";;
List.iter (fun (x:string) -> print_string x) (unique_cmps egRep);;
print_string "...finshed\n";;
