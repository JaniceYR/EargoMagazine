import React from 'react';

export default class Magazine extends React.Component {
  constructor(props) {
    super(props);
    this.wiki = this.props.wiki;
    this.className = this.props.index % 2 === 0 ? "magazine-even" : "magazine-odd";
  }

  

  render() {
    return (
      <div className={this.className}>
        <ul >
          <li>
            <img src={`https://en.wikipedia.org/wiki/File:${this.wiki.logo_url}`}></img>
            {this.wiki.logo_url}
            <img src={`https://en.wikipedia.org/wiki/${this.wiki.name}#/media/File:${this.wiki.logo_url}`}></img>
            <img src="https://en.wikipedia.org/wiki/Gizmodo#/media/File:Gizmodoscreenshot.png"></img>
          </li>
          <li>
            <ul>
              <li>
                {this.wiki.name}
              </li>
              <li>
                {this.wiki.site_type}
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
            </ul>
          </li>
        </ul>
      </div>
    );
  }
}
