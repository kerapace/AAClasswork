import todosReducer from "./todos_reducer.js";
import stepsReducer from "./steps_reducer.js";
import errorsReducer from "./errors_reducer.js";
import {combineReducers} from "redux";

const rootReducer = combineReducers({
  todos: todosReducer, 
  steps: stepsReducer,
  errors: errorsReducer
});

export default rootReducer;