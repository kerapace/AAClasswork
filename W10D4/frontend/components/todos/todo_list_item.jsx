import React from 'react';
import ToDoDetailViewContainer from "./details/todo_detail_view_container"

const toggleDone = (item) => Object.assign({},item,{done: !item.done});

class ToDoListItem extends React.Component { 
  constructor(props) {
    super(props);
    this.state = {
      detail: false
    };
    this.handleClick = this.handleClick.bind(this);
  }  

  handleClick(e) {
    let toggle = this.state.detail;
    toggle = !toggle;
    this.setState({detail: toggle});
  }

  render() {return (
    <li><p onClick={this.handleClick}>{this.props.item.title}</p>
      <button onClick={() => removeTodo(this.props.item)}>Remove Todo</button>
      <button onClick={() => {receiveTodo(toggleDone(this.props.item))}}>{this.props.item.done ? "Mark Incomplete" : "Mark Complete"}</button>
      {this.state.detail ? <ToDoDetailViewContainer todo={this.props.item}/> : ""}
    </li>
  );}
}

export default ToDoListItem;