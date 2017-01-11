import React, { Component } from 'react';
import Header from '../Header'
import FancyBox from '../FancyBox'
import './App.css';

class App extends Component {
  render() {
    return (
      <div className="App">
        <Header title="Welcome" className="App-header"/>
        <p className="App-intro">
          Those who need to see in order to know or believe, draw and paint 
          and fix the lake of changing, ocellated skin and make the purely 
          tactile visible by means of colours and shapes. But every epidermis 
          would require a different <code>tattoo</code>; it would have to 
          evolve with time: each face requires an original tactile mask.
        </p>
        <div className="centered-div">
          <FancyBox color="red" />
        </div>
      </div>
    );
  }
}

export default App;
