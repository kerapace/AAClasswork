import {connect} from 'react-redux';
import {allTodos} from '../../reducers/selectors';
import {receiveTodo} from '../../actions/todo_actions';
import ToDoList from './todo_list';

const mapStateToProps = function(state) {
  return {
    todos: allTodos(state)
  };
}

const mapDispatchToProps = function(dispatch) {
  return {
    receiveTodo: todo => dispatch(receiveTodo(todo))
  };
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ToDoList);