import React, { Component } from 'react';
import words from 'random-words'
import './App.css';

class App extends Component {

  constructor() {
    super()

    this.state = {
      words: ""
    }
  }


  changeText = () => {
    this.setState({
      words: words(10).join(' ')
    })
  }

  render() {
    return (
      <div className="App">
        <div className='content-container'>
          <button className='change-button' onClick={this.changeText}>Click Me!</button>
          <div className='text-container'>{this.state.words}</div>
        </div>
      </div>
    );
  }
}

export default App;
