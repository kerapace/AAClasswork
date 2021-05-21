import { connect } from "react-redux";
import StepList from './step_list';

const { removeStep, receiveStep } = require("../../../actions/step_actions");
const { allSteps } = require("../../../reducers/selectors");

const mapStateToProps = (state, {todo}) => {
  return {
    todo,
    steps: allSteps(state, todo)
  };
}

const mapDispatchToProps = (dispatch) => {
  return {
    removeStep: (step) => dispatch(removeStep(step)),
    receiveStep: (step) => dispatch(receiveStep(step))
  };
};

export default connect(mapStateToProps,mapDispatchToProps)(StepList);