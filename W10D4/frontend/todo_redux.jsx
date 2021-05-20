import configureStore from "./store/store.js";
import * as Todo from "./actions/todo_actions";

window.store = configureStore();
window.Todo = Todo;