const choo = require('choo')
const html = require('choo/html')
const app = choo()

// app.model({
//   state: {}
// })
const maybe = vl => vl || ''

/****
Note that these pure functions won't perform intelligent updates (I don't think);
they'll just re-render all elements inside their body each time there is a change
to the outer App scaffold. This doesn't matter at present, but will once there is
any sort of uni-directional data flow that updates the component tree props.
****/
const Header = props => html`
  <div class="${maybe(props.className)}">
    <img src="logo.svg" class="App-logo" alt="logo">
    <h2>${maybe(props.title)}</h2>
  </div>
`

const List = props => html`
  <div class="list-container">
    ${props.title ? html`<h4 class="list-title">${props.title}</h4>`:''}
    ${(props.items && (props.items.length > 0)) ? html`<ul>
      ${props.items.map(item => html`<li>${item}</li>`)}
    </ul>`:''}
  </div>
`

const FancyBox = props => html`
  <div class="box-container" style="border-color:${props.color}">
    <h2>Fancy Box</h2>
    <p>Welcome to a component-hierarchised application.</p>
    ${List({ title: 'Features', items: props.features })}
  </div>
`

/* Create the App as a view, rather than a function that dumb generates HTML. */
const App = (state, prev, send) => html`
  <div class="App">
    ${Header({ title: 'Welcome', className: 'App-header' })}
    <p class="App-intro">
      Those who need to see in order to know or believe, draw and paint 
      and fix the lake of changing, ocellated skin and make the purely 
      tactile visible by means of colours and shapes. But every epidermis 
      would require a different <code>tattoo</code>; it would have to 
      evolve with time: each face requires an original tactile mask.
    </p>
    <div class="centered-div">
      ${FancyBox({
        color: 'red',
        features: ['Component inference', 'Cross-framework scaffolding']
      })}
    </div>
  </div>
`

app.router(route => [
  route('/', App)
])

const tree = app.start()
document.body.appendChild(tree)

