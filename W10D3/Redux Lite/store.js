import * as Reducers from 'reducers.js';

class Store{
  constructor(rootReducer){
    this.state = {};
    this.rootReducer = rootReducer;
  }

  getState(){
    return Object.assign(this.state);
  }

}

const addaction = {
  type: "add an element",
  NewElement: ""
}

const changeListItem = (key, val) => {
  return Object.assign({},this.state,{key: val});
}

let store = new Store(listReducer);

store.rootReducer