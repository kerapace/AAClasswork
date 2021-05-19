import React from "react";

export default class Autocomplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      inputVal: ""
    };
    this.change = this.change.bind(this);
  }

  change(event) {
    const newVal = event.target.value;
    this.setState({inputVal: newVal});
  }

  render() {
    return (
      <div className="autocomplete">
        <input type="text" name="autocomplete-input" placeholder="type here" onChange={this.change}></input>
        <ul>
        {
          this.props.names
          .filter((el) => this.state.inputVal !== "" && el.match(new RegExp("^"+escapeRegex(this.state.inputVal),'i')))
          .map((el,idx) => <li key={idx}>{el}</li>)
        }
        </ul>
      </div>
    );
  }
}

function escapeRegex(string) {
  return string.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');  
}