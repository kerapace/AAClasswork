export const allTodos = state => {
  return Object.values(state.todos)
};

export const allSteps = (state, todo) => (
  Object.values(state.steps).filter(el => (
    el.todo_id === todo.id
  ))
);

export const allErrors = (state) => {
  return state.errors;
}