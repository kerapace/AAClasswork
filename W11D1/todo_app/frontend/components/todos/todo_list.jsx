import ToDoListItem from "./todo_list_item.jsx";
import ToDoListForm from "./todo_list_form.jsx";
import React from 'react';

const ToDoList = (props) => {
  return (
    <>
      <h3>Todo List goes here!</h3>
      <ul>
        {props.todos.map((el, idx) => {
          return <ToDoListItem key={el.id} item={el} removeTodo ={props.removeTodo} receiveTodo={props.receiveTodo}/>
        })}
      </ul>
      <ToDoListForm receiveTodo={props.receiveTodo}/>
    </>
  );
};

export default ToDoList;