import {receiveAllPokemon, requestAllPokemon} from './actions/pokemon_actions';

import configureStore from "./store/store.js";
import {fetchAllPokemon} from "./util/api_util.js";
import {selectAllPokemon} from './reducers/selectors';

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.receiveAllPokemon = receiveAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.selectAllPokemon = selectAllPokemon;
});