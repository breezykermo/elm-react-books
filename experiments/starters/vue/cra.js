Vue.component('Header', {
  props: {
    title: String,
    className: String
  },
  template: (
    '<div :class="className">'+
      '<img src="logo.svg" class="App-logo" alt="logo">'+
      '<h2>{{ title }}</h2>'+
    '</div>'
  )
})

Vue.component('List', {
  props: {
    title: String,
    items: Array
  },
  template: (
    '<div class="list-container">'+
      '<h4 v-if="title" class="list-title">{{ title }}</h4>'+
      '<ul v-if="items && (items.length > 0)">'+
        '<li v-for="item in items">{{ item }}</li>'+
      '</ul>'+
    '</div>'
  )
})

Vue.component('FancyBox', {
  props: {
    color: {
      validator: value => ['red', 'green', 'blue'].includes(value)
    },
    features: Array
  },
  template: (
    '<div class="box-container" :style="\'border-color:\'+color">'+
      '<h2>Fancy Box</h2>'+
      '<p>Welcome to a component-hierarchised application.</p>'+
      '<List title="Features" :items="features"></List>'+
    '</div>'
  )
})

Vue.component('App', {
  template: (
    '<div class="App">'+
      '<Header title="Welcome" className="App-header" />'+
      '<p class="App-intro">'+
        'Those who need to see in order to know or believe, draw and paint '+
        'and fix the lake of changing, ocellated skin and make the purely '+
        'tactile visible by means of colours and shapes. But every epidermis '+
        'would require a different <code>tattoo</code>; it would have to '+
        'evolve with time: each face requires an original tactile mask.'+
      '</p>'+
      '<div class="centered-div">'+
        '<FancyBox color="red" :features="['+
          '\'Component inference\','+
          '\'Cross-framework scaffolding\''+
        ']"'+'></FancyBox>'+
      '</div>'+
    '</div>'
  )
})

/* Mount Vue instance on DOM */
const instance = new Vue({
  el: '#vue-instance'
})