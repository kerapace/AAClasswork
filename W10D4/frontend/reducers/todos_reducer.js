import {RECEIVE_TODOS} from "../actions/todo_actions";

const todosReducer = (state = {}, action) => {
  Object.freeze(state);
  newState = Object.assign({}, state);
  switch (action.type) {
    // case RECEIVE_TODOS:
    //   if (action.todo.id === undefined) {
    //     let newId = Math.max(0, Object.keys(state)) + 1;
    //     newState[newId] = action.todo;
    //   } else {
    //     newState[action.todo.id] = action.todo;
    //   }
    default:
      return state;
  }
};

export default todosReducer;