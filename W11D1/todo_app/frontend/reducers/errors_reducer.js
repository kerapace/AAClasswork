import {CLEAR_ERRORS, RECEIVE_ERRORS} from '../actions/error_actions';

const errorsReducer = (state = [], action) => { 
  debugger
  switch (action.type) {
    case RECEIVE_ERRORS:
      return action.errors;
    case CLEAR_ERRORS:
      return [];
    default:
      return state;
  }
};

export default errorsReducer;