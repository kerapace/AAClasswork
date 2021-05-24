import {createStore, applyMiddleware} from "redux";
import rootReducer from "../reducers/root_reducer.js";
import thunk from "../middlewares/thunk.js";

const handleChange = (store) => {
  window.localStorage.setItem('todoList', JSON.stringify(store.getState()));
}

const configureStore = () => {
  // const initialState = JSON.parse(window.localStorage.getItem('todoList')) || {};

  const store = createStore(rootReducer, {}, applyMiddleware(thunk));

  store.subscribe(() => handleChange(store));

  return store;
};

export default configureStore;