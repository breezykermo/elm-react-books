type node =
  | Component of string * node list
(* represent all html tags as discrete building blocks, with no chacter,
   as we are only interested in the React components.
   The first tuple here is 'name' joined to a list of (string*string)
   pairs, which represent the attributes on the HTML element.
*)
  | Html of (string*((string*string) list)) * node list
(* represents raw text in the JSX/HTML structure *)
  | Text of string


let craRep = Component("App", [
  Html(("div", [("className", "App")]), [
    Html(("div", [("className", "App-header")]), [
      Html(("img", [("className", "App-logo"); ("alt", "logo")]), []);
      Html(("h2", []), [
        Text("Welcome to React")
      ]);
      Html(("p", [("className", "App-intro")]), [
        Text("To get started, edit ");
        Html(("code", []), [
          Text("src/App.js")
        ]);
        Text(" and save to reload")
      ])
    ])
  ])
])

(*
I probably don't want to specify 'classNames' and attributes in an HTML tag, as
I don't want to limit the representation to HTML. What would be more expansive
is to only have one component, with attributes, that renders other components
or a value (which will be an HTML Component with text in the case of React,
and a Text component with text in the case of React Native). This is a more
flexible abstraction, I think.

Then I can blacklist HTML elements for certain operations, e.g. in scaffolding
web-based React applications.
*)
