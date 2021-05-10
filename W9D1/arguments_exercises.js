// function sum() {
//     sum = 0;
//     for(let i = 0; i < arguments.length; i++) {
//         sum += arguments[i];
//     }
//     return sum;
// }

function sum(... args) {
    sum = 0;
    for(let i = 0; i < args.length; i++) {
        sum += args[i];
    }
    return sum;
}

console.log(sum(1,2,3,4,6)); // = 16

// Function.prototype.myBind = function (ctx) {
//     btargs = Array.prototype.slice.call(arguments,1);
//     const that = this;
//     return function () {
//         const ctargs = arguments;
//         that.call(ctx,...btargs,...ctargs);
//     }
// }

Function.prototype.myBind = function (ctx, ...btargs) {
    const that = this;
    return function (...ctargs) {
        that.call(ctx,...btargs,...ctargs);
    }
}


class Cat {
    constructor(name) {
      this.name = name;
    }
  
    says(sound, person) {
      console.log(`${this.name} says ${sound} to ${person}!`);
      return true;
    }
  }
  
  class Dog {
    constructor(name) {
      this.name = name;
    }
  }

    const markov = new Cat("Markov");
    const pavlov = new Dog("Pavlov");

  markov.says.myBind(pavlov, "meow", "Kush")();
  markov.says.myBind(pavlov)("meow", "a tree");

  
