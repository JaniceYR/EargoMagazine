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
        <div className="root">
          <div className="root-frame">
            {
              this.state.wikis.map((wiki, index) => {
                return (
                  <ul key={`wiki-${index}`}>
                    <li>
                      {wiki.name}
                    </li>
                    <li>
                      {wiki.site_type}
                    </li>
                    <li>
                      {wiki.logo_url}
                    </li>
                    <li>
                      {wiki.founded}
                    </li>
                    <li>
                      {wiki.created}
                    </li>
                    <li>
                      {wiki.editor}
                    </li>
                    <li>
                      {wiki.owner}
                    </li>
                    <li>
                      {wiki.url}
                    </li>
                    <br/>
                      <br/>
                    <br/>
                  </ul>
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
