import React from "react";
class StepList extends React.Component {
  constructor(props) {
    super(props);
  }



  render() {
    return (<ul>
      {steps.map((step, idx) => (
        <li key={idx}>{step.title}</li>
      ))}
      </ul>
    );
  };
}