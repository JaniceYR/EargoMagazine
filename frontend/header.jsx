import React from 'react';

export default class Header extends React.Component {
    render() {
      return(
        <div className="header">
          <div className="header-frame">
            <ul className="header-logo">
            </ul>
            <ul className="header-mentions">
              <h1>
                Magazine
              </h1>
            </ul>
          </div>
        </div>
      );
    }
}
