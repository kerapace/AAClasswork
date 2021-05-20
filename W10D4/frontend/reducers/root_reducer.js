import TodosReducer from "./todos_reducer.js";
import {combineReducers} from "redux";

const rootReducer = combineReducers({todos: TodosReducer});

export default rootReducer;