import React from 'react';
import ReactDOM from 'react-dom';
import * as APIUtil from './util/api_util.js';
import Header from './header';

class Root extends React.Component {

  constructor(props){
    super(props);
    this.state = {};
  }

  componentWillMount() {
    let magazines = ["Popular Science", "PC Magazine", "TechCrunch", "Gizmodo", "The Verge", "GeekWire"];
    APIUtil.fetchMagazines(magazines).then(
      (wikis) => {
        this.setState({wikis: wikis});
        console.log(this.state);
      }
    );
  }

  render() {
    if (!this.state.wikis) {
      return null;
    }
    return(
      <div>
        <Header />
        reacT!!!!
        {
          this.state.wikis.map((wiki) => {
          return wiki.name;
        })
      }
      </div>
    );
  }
}

export default Root;
