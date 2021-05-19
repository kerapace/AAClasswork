import React from "react";

export default class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedIdx: 0
    };
    this.click = this.click.bind(this);
  }

  render() {
    return (
      <div className="tabs-container">
        <Header tabs={this.props.tabs} clickFunction={this.click}/>
        <article className="tab-display">{this.props.tabs[this.state.selectedIdx].content}</article>
      </div>
    );
  }

  click(idx) {
    return () => {
      this.setState({selectedIdx: idx});
    };
  }
}

const Header = (props) => {
  return (<nav>
      <ul className="tab-header">
      {
        props.tabs.map((tab,idx) => <li key={idx} onClick={props.clickFunction(idx)}><h2>{tab.title}</h2></li>)
      }
      </ul>
    </nav>);
};