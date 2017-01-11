import MyComponent from './MyComponent.html';

const component = new MyComponent({
  // 'target' is the only required option - the element
  // to render to component to
  target: document.querySelector( 'main' ),
  // 'data' is optional. A component can also have
  // default data.
  data: {
    questions: [
      'life',
      'universe',
      'everything'
    ],
    answer: 42
  }
})

/* OBSERVERS */
/* ********* */
// component.observe(key, callback[, options])
// the callback takes two args, the current value and the previous value
// 'oldAnswer' will be undefined the first time the callback is called.
const observer = component.observe('answer', (answer, oldAnswer) => {
  console.log(`the answer is ${answer}`);
}); // optional final arg for observe is options: { init: false } will not
    // fire the observe on the initial component render.
// fires immediately with current answer
component.set({ answer: 'google it' });
// fires again when answer changes
// observers are called before the DOM updates, like React.

observer.cancel() // further changes will be ignored.

// component.on(event, handler) --> listens for lifecycle events of component
// component.teardown() --> tears component down from DOM, cancels all listeners.

