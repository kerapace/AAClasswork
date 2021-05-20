import React from 'react';
import ReactDOM from 'react-dom';

import Root from "./components/root.jsx";

// testing
import configureStore from "./store/store.js";
import * as Todo from "./actions/todo_actions";
import * as Step from "./actions/step_actions";
import {allTodos} from "./reducers/selectors";

window.store = configureStore();
window.Todo = Todo;
window.Step = Step;
window.allTodos = allTodos;

document.addEventListener('DOMContentLoaded', e => {
  let contentElement = document.getElementById('content');
  let store = configureStore();
  ReactDOM.render(<Root store={store}/>, contentElement);
});