import {createStore} from "redux";
import rootReducer from "../reducers/root_reducer.js";

const handleChange = (store) => {
  window.localStorage.setItem('todoList', JSON.stringify(store.getState()));
}

const configureStore = () => {
  const initialState = JSON.parse(window.localStorage.getItem('todoList'));

  const store = createStore(rootReducer, initialState || undefined);

  store.subscribe(() => handleChange(store));

  return store;
};

export default configureStore;