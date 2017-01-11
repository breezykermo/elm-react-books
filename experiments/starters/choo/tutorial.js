const choo = require('choo')
const html = require('choo/html')

const app = choo()

app.model({
  state: {
    todos: []
  },
  reducers: {
    addTodo: (data, state) => {
      const newTodos = state.todos.slice()
      newTodos.push(data)
      return { todos: newTodos }
    }
  }
})

function onSubmit(e) {
  const input = e.target.children[0]
  send('addTodo', { title: e.target.children[0].value })
  input.value = ''
  e.preventDefault()
}

const view = (state, prev, send) => html`
  <div>
    <form onsubmit=${onSubmit}}>
      <input type="text" placeholder="New item" id="title">
    </form>
    <ul>
      ${state.todos.map(todo => html`<li>${todo.title}</li>`)}
    </ul>
  </div>
`

app.router(route => [
  route('/', view)
])

const tree = app.start()
document.body.appendChild(tree)
