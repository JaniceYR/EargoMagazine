import React from 'react';

export default class Magazine extends React.Component {
  constructor(props) {
    super(props);
    this.wiki = this.props.wiki;
  }

  renderImage(index) {
    if (((index === 1) && (this.props.index % 2 === 1)) || ((index === 2) && (this.props.index % 2 === 0))) {
      return ("");
    }
    return (
      <li className="magazine-image">
        <img src={this.wiki.logo_url}></img>
      </li>
    );
  }

  render() {
    return (
      <div className="magazine-frame">
        <ul className="magazine-frame">
          {this.renderImage(1)}
          <li className="magazine-info">
            <ul>
              <li className="magazine-name">
                {this.wiki.name}
                <a>{
                  (this.wiki.site_type) ?
                      `(${this.wiki.site_type})` : ""
                }</a>
              </li>
              <li>
                Launched in {this.wiki.founded} <a>{
                  this.wiki.created ?
                  `by ${this.wiki.created}` : ""
                }</a>
              </li>
              <li>
              {
                this.wiki.editor ?
                `Editor : ${this.wiki.editor}` : ""
              }
              </li>
              <li>
                {
                  this.wiki.owner ?
                  `Owned By ${this.wiki.owner}` : ""
                }
              </li>
              <li>
                Homepage :<a href={this.wiki.url} className="magazine-url">{this.wiki.url}</a>
              </li>
            </ul>
          </li>
          {this.renderImage(2)}
        </ul>
      </div>
    );
  }
}
