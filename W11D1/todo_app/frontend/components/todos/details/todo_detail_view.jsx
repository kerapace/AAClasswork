import React from 'react';
import todo_detail_view_container from './todo_detail_view_container';

import StepListContainer from './step_list_container';

const ToDoDetailView = ({todo, recieveTodo}) => {
  return (<ul>
    <li key="body">{todo.body}</li>
    <li key="done">{todo.done ? "Done" : "Not Done"}</li>
    <StepListContainer todo={todo} />
  </ul>);
}

export default ToDoDetailView;