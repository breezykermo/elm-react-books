require('ace-css/css/ace.css')
require('font-awesome/css/font-awesome.css')

// require index.html so that it gets copied to /dist
require('./index.html')

const Elm = require('./Main.elm')
const mountNode = document.getElementById('main')

/*
embed can take an optional second argument. This would be
an object describing we need to start a program, i.e. a
userID or some token.
*/
const app = Elm.Main.embed(mountNode)
