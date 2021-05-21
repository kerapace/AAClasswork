const ToDoList = (props) => (
  <>
    <h3>Todo List goes here!</h3>
    <ul>
      {props.todos.map((el, idx) => {
        <TodoListItem item={el} />
      })}
    </ul>
  </>
);

export default ToDoList;