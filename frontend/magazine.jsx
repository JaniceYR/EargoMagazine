import React from 'react';

export default class Magazine extends React.Component {
  constructor(props) {
    super(props);
    this.wiki = this.props.wiki;
  }

  render() {

    return (
      <div>
        <ul >
          <li>
            {this.wiki.name}
          </li>
          <li>
            {this.wiki.site_type}
          </li>
          <li>
            {this.wiki.logo_url}
          </li>
          <li>
            {this.wiki.founded}
          </li>
          <li>
            {this.wiki.created}
          </li>
          <li>
            {this.wiki.editor}
          </li>
          <li>
            {this.wiki.owner}
          </li>
          <li>
            {this.wiki.url}
          </li>
          <br/>
            <br/>
          <br/>
        </ul>
      </div>
    );
  }
}
