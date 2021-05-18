const DOMNodeCollection = require("./dom_node_collection");

window.$l = function (arg) {
  const func_array = [];
  document.addEventListener("DOMContentLoaded",() => {
    func_array.forEach((f) => f())
  });
  if(typeof arg === "HTMLElement") {
    return new DOMNodeCollection([arg]);
  }
  else if(typeof arg === "string") {
    return new DOMNodeCollection(Array.from(document.querySelectorAll(arg)));
  }
  else if(typeof arg === "function") {
    if(document.readyState === "complete") {
      arg();
    }
    else
    {
      func_array.push(arg);
    }
  }
};

window.$l.extend = function(...objs) {
  const finalObj = {};
  for(let i = 0; i < objs.length; i++) {
    for([variable, value] of Object.entries(objs[i])) {
      finalObj[variable] = value;
    }
  }
  return finalObj;
};

const defaults = {
  url: "https://127.0.0.1",
  success: (e) => JSON.stringify(e),
  error: () => console.log("Something went wrong."),
  data: {},
  contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
  type: 'GET'
};

window.$l.ajax = function(options) {
  this.extend(defaults,options);
  const xhr = new XMLHttpRequest();
  xhr.onload = function() {
    options.success(xhr.response);}
  xhr.open(options.type, options.url);
  xhr.send();
};

$l(() => $l.ajax({
  type: 'GET',
  url: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success(data) {
    console.log("We have your weather!")
    console.log(data);
  },
  error() {
    console.error("An error occurred.");
  },
}));