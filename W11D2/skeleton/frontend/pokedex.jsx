import {receiveAllPokemon} from './actions/pokemon_actions';

import configureStore from "./store/store.js";

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.receiveAllPokemon = receiveAllPokemon;
});