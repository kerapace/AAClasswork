import React from "react";
import StepForm from "./step_form.jsx";

const toggleDone = (item) => Object.assign({},item,{done: !item.done});

const StepList = ({todo, steps, removeStep, receiveStep}) => {
  return (
    <>
      <ul>
        <h5>Steps</h5>
        {steps.map((step, idx) => (
          <li key={idx}>
            {step.title}
            {step.done ? "Done" : "Not Done"}
            <button onClick={() => removeStep(step)}>Remove Step</button>
            <button onClick={() => {receiveStep(toggleDone(step))}}>{step.done ? "Mark Incomplete" : "Mark Complete"}</button>
          </li>
        ))}
      </ul>
      <StepForm todo_id={todo.id} receiveStep = {receiveStep}/>
    </>
  );
}

export default StepList;