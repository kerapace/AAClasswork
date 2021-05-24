import React from 'react';
import ReactDOM from 'react-dom';

import Root from "./components/root.jsx";

// testing
import configureStore from "./store/store.js";
import * as Todo from "./actions/todo_actions";
import * as Step from "./actions/step_actions";
import {allTodos} from "./reducers/selectors";

import {fetchTodos, createTodo} from "./util/todo_api_util";

// window.store = configureStore();
// window.Todo = Todo;
// window.Step = Step;
// window.allTodos = allTodos;

document.addEventListener('DOMContentLoaded', e => {
  let rootElement = document.getElementById('root');
  let store = configureStore();
  ReactDOM.render(<Root store={store}/>, rootElement);

  window.store = store;
  window.fetchTodos = Todo.fetchTodos;
  window.createTodo = Todo.createTodo;

  store.dispatch((dispatch) => {
    console.log("If this prints out, the thunk middleware is working!")
  });
});