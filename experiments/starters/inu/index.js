const { start, html, pull } = require('inu')
const delay = require('pull-delay')

const SCHEDULE_TICK = 'SCHEDULE_TICK'
const maybe = vl => vl || ''

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

const app = {
  init: () => ({
    model: 0,
    effect: SCHEDULE_TICK
  }),

  update: (model, action) => {
    switch (action) {
      case 'TICK':
        return {
          model: (model + 1) % 60,
          effect: SCHEDULE_TICK
        }
      default:
        return { model }
    }
  },

  view: (model, dispatch) => html`
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
  `,

  run: (effect, sources) => {
    switch (effect) {
      case 'SCHEDULE_TICK':
        return pull(
          pull.values(['TICK']),
          delay(10000)
        )
    }
  }
}

const main = document.querySelector('.main')
const { views } = start(app)

pull(
  views(),
  pull.drain(view => {
    console.log(view)
    html.update(main, view)
  })
)
