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

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/***/ ((module) => {

eval("class DOMNodeCollection {\n  constructor(arr) {\n    this.elements = arr;\n  }\n\n  html(str = null) {\n    if(str === null) {\n      return this.elements[0].innerHTML;\n    }\n    else {\n      this.elements.forEach((el) => {el.innerHTML = str;});\n    }\n  }\n\n  empty() {\n    this.html(\"\");\n  }\n\n  append(children) {\n    if(typeof children === \"DOMNodeCollection\") {\n      this.elements.forEach((parent) => {\n        children.elements.forEach((child) => parent.innerHTML += child.outerHTML)\n      });\n    }\n    else if (typeof children === \"string\" || typeof children === \"HTMLElement\") {\n      this.elements.forEach((parent) => parent.innerHTML += children);\n    }\n  }\n\n  addClass(classname) {\n    this.elements.forEach((parent) => parent.classList.add(classname));\n  }\n\n  removeClass(classname) {\n    this.elements.forEach((parent) => parent.classList.remove(classname));\n  }\n\n  toggleClass(classname) {\n    this.elements.forEach((parent) => {parent.classList.toggle(classname)});\n  }\n\n  attr(key, value = null) {\n    if (value === null) {\n      return this.elements.map((el) => el.attributes.getNamedItem(key));\n    }\n    else {\n      this.elements.forEach((el) => el.attributes.setNamedItem(key,value));\n    }\n  }\n  \n  children() {\n    let childrenArray = [];\n    for(let i = 0; i < this.elements.length; i++) {\n      this.elements.forEach((el) => childrenArray = childrenArray.concat(recursiveTraverseNode(el)));\n    }\n    return new DOMNodeCollection(childrenArray.filter(onlyUnique));\n  }\n\n  parent() {\n    return new DOMNodeCollection(this.elements.map((el) => el.parentElement));\n  }\n\n  find(query) {\n    let matchingElements = [];\n    matchingElements = matchingElements.concat(this.elements.querySelectorAll(query));\n    return new DOMNodeCollection(matchingElements.filter(onlyUnique));\n  }\n\n  remove() {\n    this.elements.forEach((el) => el.html(\"\"));\n  }\n\n  on(...args) {\n    const callback = args.pop();\n    const type = args[0];\n    const target = args[1] || null;\n    let newCallback = function() {};\n    if(target !== null) {\n      newCallback = function(event) {\n        if(event.target.matches(target)) {callback(event);}\n      };\n    }\n    else {newCallback = callback;}\n    this.elements.forEach((el) => {\n      el.addEventListener(type, newCallback);\n      el[type] = callback;\n    });\n  }\n  \n  off(type) {\n    this.elements.forEach((el) => {\n      const callback = el[type];\n      if(callback !== undefined) {\n        el.removeEventListener(type, callback);\n      }\n    });\n  }\n}\n\nfunction recursiveTraverseNode(node) {\n  let allChildren = [node];\n  [...node.children].forEach((child) => {\n    allChildren = allChildren.concat(recursiveTraverseNode(child));\n  });\n  return allChildren;\n}\n\nfunction onlyUnique(value,index,thisArg) {\n  return thisArg.indexOf(value) === index;\n}\n\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection */ \"./src/dom_node_collection.js\");\n\nwindow.$l = function (arg) {\n  const func_array = [];\n  document.addEventListener(\"DOMContentLoaded\",() => {\n    func_array.forEach((f) => f())\n  });\n  if(typeof arg === \"HTMLElement\") {\n    return new DOMNodeCollection([arg]);\n  }\n  else if(typeof arg === \"string\") {\n    return new DOMNodeCollection(Array.from(document.querySelectorAll(arg)));\n  }\n  else if(typeof arg === \"function\") {\n    if(document.readyState === \"complete\") {\n      arg();\n    }\n    else\n    {\n      func_array.push(arg);\n    }\n  }\n};\n\nwindow.$l.extend = function(...objs) {\n  const finalObj = {};\n  for(let i = 0; i < objs.length; i++) {\n    for([variable, value] of Object.entries(objs[i])) {\n      finalObj[variable] = value;\n    }\n  }\n  return finalObj;\n};\n\nconst defaults = {\n  url: \"https://127.0.0.1\",\n  success: (e) => JSON.stringify(e),\n  error: () => console.log(\"Something went wrong.\"),\n  data: {},\n  contentType: 'application/x-www-form-urlencoded; charset=UTF-8',\n  type: 'GET'\n};\n\nwindow.$l.ajax = function(options) {\n  this.extend(defaults,options);\n  const xhr = new XMLHttpRequest();\n  xhr.onload = function() {\n    options.success(xhr.response);}\n  xhr.open(options.type, options.url);\n  xhr.send();\n};\n\n$l(() => $l.ajax({\n  type: 'GET',\n  url: \"http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b\",\n  success(data) {\n    console.log(\"We have your weather!\")\n    console.log(data);\n  },\n  error() {\n    console.error(\"An error occurred.\");\n  },\n}));\n\n//# sourceURL=webpack:///./src/index.js?");

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