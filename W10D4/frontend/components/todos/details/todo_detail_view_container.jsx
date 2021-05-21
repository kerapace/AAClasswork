import { connect } from "react-redux";
import ToDoDetailView from "./todo_detail_view";
const { receiveTodo } = require("../../../actions/todo_actions");


const mapDispatchToProps = (dispatch) => {
  return {
    receiveTodo: () => {dispatch(receiveTodo())}
  };
};

export default connect(null,mapDispatchToProps)(ToDoDetailView);