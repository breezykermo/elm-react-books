(********************)
(* String Templates *)
(********************)
open Defs
open Util

module type RendererOptions =
  sig
    val folder_name: string
  end

module type Renderer =
  sig
    (* Return string for file from name. *)
    val component: string -> string
    (* generate infrastructural files *)
    val infrastructure: unit -> unit
    (* SIDE EFFECTS: generate files from representation. *)
    val scaffold: node -> unit
  end

let fsc (name: string) =
"import React from 'react'

const "^name^" = (props) => (
  <div>This is a "^name^" component.
)

export default "^name

module ReactRedux(OPT:RendererOptions): Renderer =
  struct
    let component (name:string): string = fsc name
    let infrastructure () = ()
    let scaffold (rep:node) =
      generate_components rep OPT.folder_name component
  end
