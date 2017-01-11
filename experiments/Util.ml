open Defs

let fold = fun x y z -> List.fold_right x z y

let rec map (convert_name: string -> string)
            (convert_node: (string * node list) -> string)
            (convert_html: (string * node list) -> string)
            (node: node)
      : node = failwith "unimplemented"

(* Reduce names of Components (will read over HTML) *)
let rec reduce_names (f: string -> 'a -> 'a) (acc: 'a) (node: node): 'a =
  match node with
  | Component (parent, children) ->
    fold (fun child pr -> reduce_names f pr child) (f parent acc) children
  | Html (parent, children) ->
    fold (fun child pr -> reduce_names f pr child) acc children
  | Text x -> acc

(* Returns an array of unique components in a representation. *)
let unique_cmps (n: node): string list =
  reduce_names (fun s seen -> if List.mem s seen then seen else s::seen) [] n

(* Generate component files through a representation, folder_name and
   'componentize' function, which returns a component from a name..*)
let generate_components (n: node)
                        (folder_name: string)
                        (componentize: string -> string)
    : unit =
  let dir_path = "./"^folder_name in
  try
    Unix.mkdir dir_path 0o640
  with
    e -> match e with
    | Unix.Unix_error(t, a1, a2) ->
      if t = Unix.EEXIST then ()
      else raise e;
  let create_file (name: string): unit =
    let message = componentize name in
    let file_path = name^".jsx" in
    let oc = open_out ("__"^file_path) in
      Printf.fprintf oc "%s\n" message;
    close_out oc; (* flush and close the channel *)
  in
  List.iter create_file (unique_cmps n);
  ()
