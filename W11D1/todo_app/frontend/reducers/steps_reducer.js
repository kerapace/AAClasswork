import {RECEIVE_STEP, RECEIVE_STEPS, REMOVE_STEP} from "../actions/step_actions";
import {REMOVE_TODO} from "../actions/todo_actions";
const initialState = {
  1: {
    id: 1,
    title: 'walk to store',
    done: false,
    todo_id: 1
  },
  2: { 
    id: 2,
    title: 'buy soap',
    done: false,
    todo_id: 1
  }
};

const stepsReducer = (state = initialState, action) => {
  Object.freeze(state);
  let newState = {};
  switch (action.type) {
    case RECEIVE_STEPS:
      action.steps.forEach(step => {
        newState[step.id] = step;
      });
      return newState;
    case RECEIVE_STEP:
      Object.assign(newState, state);
      if (action.step.id === undefined) {
        let newId = Math.max(0, Object.keys(state)) + 1;
        newState[newId] = action.step;
      } else {
        newState[action.step.id] = action.step;
      }
      return newState;
    case REMOVE_STEP:
      Object.assign(newState, state);
      delete newState[action.step.id];
      return newState;
    case REMOVE_TODO:
      Object.assign(newState, state);
      Object.keys(state).forEach((key) => {
        if(newState[key].todo_id === action.todo.id) {
          delete newState[key];
        }
      });
      return newState;
    default:
      return state;
  }
};

export default stepsReducer;