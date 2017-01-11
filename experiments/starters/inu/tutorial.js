const { start, html, pull } = require('inu')
const delay = require('pull-delay')

const SCHEDULE_TICK = 'SCHEDULE_TICK'

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
    <div class='clock'>
      Seconds Elapsed: ${model}
    </div>
  `,

  run: (effect, sources) => {
    switch (effect) {
      case 'SCHEDULE_TICK':
        return pull(
          pull.values(['TICK']),
          delay(1000)
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
