import {receiveAllPokemon, requestAllPokemon} from './actions/pokemon_actions';

import configureStore from "./store/store.js";
import {fetchAllPokemon} from "./util/api_util.js";
import {selectAllPokemon} from './reducers/selectors';

import React from "react";
import ReactDOM from "react-dom";

import Root from "./components/root.jsx";

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  const rootElement = document.getElementById("root");
  // window.getState = store.getState;
  // window.dispatch = store.dispatch;
  // window.receiveAllPokemon = receiveAllPokemon;
  // window.requestAllPokemon = requestAllPokemon;
  // window.selectAllPokemon = selectAllPokemon;
  ReactDOM.render(<Root store={store}/>,rootElement);
});