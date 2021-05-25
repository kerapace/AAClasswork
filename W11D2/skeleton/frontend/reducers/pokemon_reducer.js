import { RECEIVE_ALL_POKEMON } from "../actions/pokemon_actions.js";

const initialState = {};

const pokemonReducer = (state = initialState, action) => {
  Object.freeze(state);
  let newState = Object.assign({},state);
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      newState.pokemon = action.pokemon;
    default:
      return state;
  }
};