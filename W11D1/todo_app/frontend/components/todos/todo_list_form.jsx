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

  componentDidMount() {
    this.props.fetchTodos();
  }

  handleChange(e) {
    const name = e.target.name;
    const value = e.target.value;
    this.setState({[name]: value});
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.createTodo(this.state).then(() => this.setState({title: '', body: ''}));
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <aside>
          <ul>
          {this.props.errors.map((el,idx) => (<li key={idx}>{el}</li>))}
          </ul>
        </aside>
        <label>Title:
          <input name="title" onChange={this.handleChange} type="text" placeholder="Title" value={this.state.title} />
        </label>
        <br />
        <label>Body:
          <input name="body" onChange={this.handleChange} type="text" placeholder="Body" value={this.state.body}/>
        </label>
        <br />
        <label>
          <input name="done" type="radio" value="false" onChange={this.handleChange} defaultChecked />
          Not Done
        </label>
        <br />
        <label>
          <input name="done" type="radio" onChange={this.handleChange} value="true" />
          Done
        </label>
        <br />
        <input type="submit" value="Add To Do"></input>
      </form>
    )
  }
}

export default ToDoListForm;