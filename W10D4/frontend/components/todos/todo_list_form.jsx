import React from 'react';

class ToDoListForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: '',
      body: '',
      done: false
    }
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {
    const name = e.target.name;
    const value = e.target.value;
    this.setState({[name]: value});
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.receiveTodo(Object.assign(
      {id: new Date().getTime()},
      this.state
    ));
  }

  render() {
    return (
      <form onChange={this.handleChange} onSubmit={this.handleSubmit}>
        <label>Title:
          <input name="title" type="text" placeholder="Title" />
        </label>
        <br />
        <label>Body:
          <input name="body" type="text" placeholder="Body" />
        </label>
        <br />
        <label>
          <input name="done" type="radio" value="false" defaultChecked />
          Not Done
        </label>
        <br />
        <label>
          <input name="done" type="radio" value="true" />
          Done
        </label>
        <br />
        <input type="submit" value="Add To Do"></input>
      </form>
    )
  }
}

export default ToDoListForm;