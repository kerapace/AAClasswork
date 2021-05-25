import {createStore, applyMiddleware} from "redux";
import rootReducer from "../reducers/root_reducer";
import logger from "redux-logger";
import thunk from "../middleware/thunk";

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

const configureStore = () => createStore(rootReducer,preloadedState,applyMiddleware(thunk,logger))

export default configureStore;