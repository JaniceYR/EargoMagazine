import React from 'react';
import ReactDOM from 'react-dom';
import Header from './header';
import Magazine from './magazine';
import * as APIUtil from './util/api_util.js';

class Root extends React.Component {

  constructor(props){
    super(props);
    this.state = {};
  }

  componentWillMount() {
    let magazines = ["TechCrunch", "Gizmodo", "The Verge", "Popular Science", "PC Magazine", "GeekWire"];
    APIUtil.fetchMagazines(magazines).then(
      (wikis) => {
        this.setState({wikis: wikis});
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
        <div className="root">
          <div className="root-frame">
            {
              this.state.wikis.map((wiki, index) => {
                return (
                  <Magazine wiki={wiki} index={index} key={`wiki-${index}`}/>
                );
              })
            }
          </div>
        </div>
      </div>
    );
  }
}

export default Root;
