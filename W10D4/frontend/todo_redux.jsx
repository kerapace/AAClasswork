import configureStore from "./store/store.js";
import * as Todo from "./actions/todo_actions";
import * as Step from "./actions/step_actions";

window.store = configureStore();
window.Todo = Todo;
window.Step = Step;

const newTodos = [{ id: 1, title: 'Learn Redux', body: 'It is fundamental', done: false }, { id: 2, title: 'Grind out leetcode', body: 'It teaches you how to interview', done: false }];
const newSteps = [{ id: 1, title: 'Dispatch actions', done: false, todo_id: 1 }, { id: 2, title: 'Configure root reducers', done: true, todo_id: 1 }, {id: 3, title: 'Buy an algorithms textbook', body: "Or download one I don't care", done: false, todo_id: 2}];
store.dispatch(Todo.receiveTodos(newTodos));
store.dispatch(Step.receiveSteps(newSteps));
console.log(store.getState());

store.dispatch(Todo.receiveTodo({ id: 3, title: "New Todo", body: "example task", done: false }));
store.dispatch(Step.receiveStep({ id: 4, title: "New Step", body: "example step", todo_id: 3, done: false }));
console.log(store.getState()); // should include the newly added todo and step

store.dispatch(Todo.receiveTodo({ id: 3, title: "Newer Todo", body: "replacement task", done: true }));
store.dispatch(Step.receiveStep({ id: 4, title: "Newer Step", body: "replacement step", todo_id: 3, done: true }));
console.log(store.getState()); // should update the previously added todo and step

store.dispatch(Todo.removeTodo({ id: 3}));
store.dispatch(Step.removeStep({ id: 4}));
console.log(store.getState()); // should not include the previously added todo