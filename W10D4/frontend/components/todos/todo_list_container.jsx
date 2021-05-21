import {connect} from 'react-redux';
import {allTodos} from '../../reducers/selectors';
import {receiveTodo, removeTodo} from '../../actions/todo_actions';
import ToDoList from './todo_list';
import React from 'react';

const mapStateToProps = function(state) {
  return {
    todos: allTodos(state)
  };
}

const mapDispatchToProps = function(dispatch) {
  return {
    receiveTodo: todo => dispatch(receiveTodo(todo)),
    removeTodo: todo => dispatch(removeTodo(todo)),
  };
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ToDoList);