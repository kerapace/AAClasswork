import { RECEIVE_ALL_POKEMON } from "../actions/pokemon_actions.js";

const initialState = {};

const pokemonReducer = (state = initialState, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      let newState = action.pokemon;
      return newState;
    default:
      return state;
  }
};
export default pokemonReducer;