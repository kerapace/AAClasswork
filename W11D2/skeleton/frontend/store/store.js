import {createStore, applyMiddleware} from "redux";
import rootReducer from "../reducers/root_reducer";
import logger from "redux-logger";

const preloadedState = {}

// const myThunk = (store) => {
//   return (next) => {
//     return (action) => {
//       if(typeof action === "function") {
//         return action(store.dispatch,store.getState);
//       }
//       return next(action);
//     };
//   };
// };

const configureStore = () => createStore(rootReducer,preloadedState,applyMiddleware(logger))

export default configureStore;