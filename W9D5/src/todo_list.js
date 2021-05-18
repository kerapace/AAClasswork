const toDoList = document.querySelector(".todo");
const toDoForm = document.querySelector(".add-todo-form");
const toDoField = toDoForm.querySelector("input[name=add-todo]")

function ToDo(goal, status = false) {
  this.goal = goal;
  this.status = status;
}


function addTo(event) {
  event.preventDefault();
  let val = toDoField.value;
  new ToDo(val);
}

document.addEventListener("DOMContentLoaded", () => {
  toDoForm.addEventListener("submit", addTo);
});