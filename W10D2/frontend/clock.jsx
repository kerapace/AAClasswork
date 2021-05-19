import React from "react";

export default class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      date: new Date()
    };
  }

  componentDidMount() {
    this.interval = setInterval(this.tick.bind(this), 1000);
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  render() {
    const d = this.state.date;
    return (
      <div>
        <h1>Our Clock!</h1>
        <p>{format_time(d.getHours(),d.getMinutes(),d.getSeconds())}</p>
      </div>
    );
  }

  tick() {
    this.setState({date: new Date()});
  }
}

function format_time(hr,min,sec) {
  return [...arguments].map((num) => ("0"+num).slice(-2)).join(":");
}