/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\n\nfunction Asteroid(options) {\n  this.pos = options.pos;\n  this.vel = Util.randomVec(1);\n  this.radius = options.radius || Util.randomAsteroidSize();\n  this.color = options.color || \"#997e5d\";\n}\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\n\nconst DIM_X = 800;\nconst DIM_Y = 600;\nconst NUM_ASTEROIDS = 10;\nfunction Game(ctx) {\n  this.asteroids = this.addAsteroids();\n  this.context = ctx;\n  this.ship = new Ship({});\n}\n\nGame.prototype.addAsteroids = function() {\n  let ast = []\n  for (let i = 0; i < NUM_ASTEROIDS; i++) {\n    ast.push(new Asteroid({pos: this.randomPosition()}));\n  }\n  return ast;\n};\n\nGame.prototype.randomPosition = function() {\n  return [Math.random()*DIM_X, Math.random()*DIM_Y];\n};\n\nGame.prototype.moveObjects = function() {\n  let allObjs = this.allObjects();\n  for(let i = 0; i < allObjs.length; i++) {\n    allObjs[i].move();\n  }\n};\n\nGame.prototype.draw = function() {\n  this.context.clearRect(0,0,DIM_X,DIM_Y);\n  this.context.fillStyle = \"#222\";\n  this.context.fillRect(0,0,DIM_X,DIM_Y);\n  for(let i = 0; i < this.asteroids.length; i++) {\n    this.wrap(this.asteroids[i].pos);\n    this.asteroids[i].draw(this.context);\n  }\n};\n\nGame.prototype._XInsideWindow = function(pos) {\n  return pos[0] >= -50 && pos[0] <= DIM_X + 50;\n};\n\nGame.prototype._YInsideWindow = function(pos) {\n  return pos[1] >= -50 && pos[1] <= DIM_Y + 50;\n};\n\nGame.prototype.wrap = function(pos) {\n  if(!this._XInsideWindow(pos)) {\n    pos[0] = Util.goodModulus(pos[0]+50,DIM_X+100) - 50;\n  }\n  if(!this._YInsideWindow(pos)) {\n    pos[1] = Util.goodModulus(pos[1]+50,DIM_Y+100) - 50;\n  }\n};\n\nGame.prototype.checkCollisions = function() {\n  let allObjs = this.allObjects();\n  for (let i = 0; i < allObjs.length; i++) {\n    for (let j = i+1; j < allObjs.length; j++) {\n      if (allObjs[i].isCollidedWith(allObjs[j])) {\n        this.collide(allObjs[i],allObjs[j]);\n        i--;\n        break;\n      }\n    }\n  }\n};\n\nGame.prototype.step = function() {\n  this.moveObjects();\n  this.checkCollisions();\n};\n\nGame.prototype.remove = function(asteroid) {\n  const index = this.asteroids.indexOf(asteroid);\n  this.asteroids.splice(index,1);\n};\n\nGame.prototype.collide = function(mo1,mo2) {\n  if(mo1.isCollidedWith(mo2)) {\n    for (let i = 0; i < arguments.length; i++) {\n      if (!(arguments[i] instanceof Ship)) {\n        this.remove(arguments[i]);\n      } else {\n        this.relocate(arguments[i]);\n      }\n    }\n  }\n};\n\nGame.prototype.relocate = function(obj) {\n  obj.pos = this.randomPosition();\n};\n\nGame.prototype.allObjects = function() {\n  return this.asteroids.concat(this.ship);\n};\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n\nfunction GameView(ctx) {\n  this.game = new Game(ctx);\n  this.context = ctx;\n}\n\nGameView.prototype.start = function() {\n  setInterval(this.game.draw.bind(this.game),20);\n  setInterval(this.game.step.bind(this.game),20);\n};\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\n\ndocument.addEventListener(\"DOMContentLoaded\", function() {\n  let canvas = document.getElementById(\"asteroids-window\");\n  const ctx = canvas.getContext(\"2d\");\n  // let mo = new MovingObject({\n  //   pos: [30, 30],\n  //   vel: [10, 10],\n  //   radius: 20,\n  //   color: \"#00FF00\"\n  // });\n  // mo.draw(ctx);\n  // let ast = new Asteroid({\n  //   pos: [100, 100]\n  // });\n  // ast.draw(ctx);\n  const gameView = new GameView(ctx);\n  gameView.start();\n});\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("function MovingObject(options) {\n  this.pos = options.pos;\n  this.vel = options.vel;\n  this.radius = options.radius;\n  this.color = options.color;\n}\n\nMovingObject.prototype.draw = function(ctx) {\n  ctx.beginPath();\n  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 360);\n  ctx.fillStyle = this.color;\n  ctx.fill();\n};\n\nMovingObject.prototype.move = function() {\n  this.pos = [this.pos[0]+this.vel[0],this.pos[1]+this.vel[1]];\n};\n\nMovingObject.prototype.isCollidedWith = function(otherObj) {\n  return this.distanceBetween(otherObj) < this.radius + otherObj.radius;\n};\n\nMovingObject.prototype.distanceBetween = function(otherObj) {\n  let [x1, y1] = [this.pos[0], this.pos[1]];\n  let [x2, y2] = [otherObj.pos[0], otherObj.pos[1]];\n  return Math.sqrt( (x1-x2)**2 + (y1-y2)**2 );\n};\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const DIM_X = 800;\nconst DIM_Y = 600;\n\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\n\nfunction Ship(options) {\n  this.pos = options.pos || [Math.floor(DIM_X/5),Math.floor(DIM_Y/2)];\n  this.vel = 0;\n  this.radius = 10;\n  this.color = \"#\"+(\"00\"+(Math.floor((16**3)*Math.random())).toString(16)).slice(-3);\n}\n\nUtil.inherits(Ship,MovingObject);\n\nmodule.exports = Ship;\n\n\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/***/ ((module) => {

eval("// Function.prototype.inherits = function(parentClass) {\n//   function Surrogate() {}\n//   Surrogate.prototype = parentClass.prototype;\n//   this.prototype = new Surrogate();\n//   this.prototype.constructor = this;\n// };\n\nconst Util = {\n  inherits: function(subClass,parentClass) {\n    function Surrogate() {}\n    Surrogate.prototype = parentClass.prototype;\n    subClass.prototype = new Surrogate();\n    subClass.prototype.constructor = subClass;\n  },\n\n  randomVec: function(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  // Scale the length of a vector by the given amount.\n  scale: function(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  },\n\n  randomAsteroidSize: function() {\n    return 15 + 35 * Math.random();\n  },\n\n  goodModulus: function(x,y) {\n    return ((x % y) + y) % y;\n  }\n}\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;