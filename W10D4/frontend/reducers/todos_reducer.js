import * as Todo from "../actions/todo_actions";

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  let newState = {};
  switch (action.type) {
    case Todo.RECEIVE_TODOS:
      action.todos.forEach(todo => {
        newState[todo.id] = todo;
      });
      return newState;
    case Todo.RECEIVE_TODO:
      Object.assign(newState, state);
      if (action.todo.id === undefined) {
        let newId = Math.max(0, Object.keys(state)) + 1;
        newState[newId] = action.todo;
      } else {
        newState[action.todo.id] = action.todo;
      }
      return newState;
    default:
      return state;
  }
};

export default todosReducer;