import { connect } from "react-redux";

const { removeStep, receiveStep } = require("../../../actions/step_actions");
const { allSteps } = require("../../../reducers/selectors");

const mapStateToProps = (state, {todo}) => {
  return {
    steps: allSteps(state,todo)
  };
}

const mapDispatchToProps = (dispatch) => {
  return {
    removeStep: (step) => dispatch(removeStep(step)),
    receiveStep: (step) => dispatch(receiveStep(step))
  };
};

export default connect(mapStateToProps,mapDispatchToProps)(StepList);