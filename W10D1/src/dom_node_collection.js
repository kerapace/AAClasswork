class DOMNodeCollection {
  constructor(arr) {
    this.elements = arr;
  }

  html(str = null) {
    if(str === null) {
      return this.elements[0].innerHTML;
    }
    else {
      this.elements.forEach((el) => {el.innerHTML = str;});
    }
  }

  empty() {
    this.html("");
  }

  append(children) {
    if(typeof children === "DOMNodeCollection") {
      this.elements.forEach((parent) => {
        children.elements.forEach((child) => parent.innerHTML += child.outerHTML)
      });
    }
    else if (typeof children === "string" || typeof children === "HTMLElement") {
      this.elements.forEach((parent) => parent.innerHTML += children);
    }
  }

  addClass(classname) {
    this.elements.forEach((parent) => parent.classList.add(classname));
  }

  removeClass(classname) {
    this.elements.forEach((parent) => parent.classList.remove(classname));
  }

  toggleClass(classname) {
    this.elements.forEach((parent) => {parent.classList.toggle(classname)});
  }

  attr(key, value = null) {
    if (value === null) {
      return this.elements.map((el) => el.attributes.getNamedItem(key));
    }
    else {
      this.elements.forEach((el) => el.attributes.setNamedItem(key,value));
    }
  }
  
  children() {
    let childrenArray = [];
    for(let i = 0; i < this.elements.length; i++) {
      this.elements.forEach((el) => childrenArray = childrenArray.concat(recursiveTraverseNode(el)));
    }
    return new DOMNodeCollection(childrenArray.filter(onlyUnique));
  }

  parent() {
    return new DOMNodeCollection(this.elements.map((el) => el.parentElement));
  }

  find(query) {
    let matchingElements = [];
    matchingElements = matchingElements.concat(this.elements.querySelectorAll(query));
    return new DOMNodeCollection(matchingElements.filter(onlyUnique));
  }

  remove() {
    this.elements.forEach((el) => el.html(""));
  }

  on(...args) {
    const callback = args.pop();
    const type = args[0];
    const target = args[1] || null;
    let newCallback = function() {};
    if(target !== null) {
      newCallback = function(event) {
        if(event.target.matches(target)) {callback(event);}
      };
    }
    else {newCallback = callback;}
    this.elements.forEach((el) => {
      el.addEventListener(type, newCallback);
      el[type] = callback;
    });
  }
  
  off(type) {
    this.elements.forEach((el) => {
      const callback = el[type];
      if(callback !== undefined) {
        el.removeEventListener(type, callback);
      }
    });
  }
}

function recursiveTraverseNode(node) {
  let allChildren = [node];
  [...node.children].forEach((child) => {
    allChildren = allChildren.concat(recursiveTraverseNode(child));
  });
  return allChildren;
}

function onlyUnique(value,index,thisArg) {
  return thisArg.indexOf(value) === index;
}

module.exports = DOMNodeCollection;