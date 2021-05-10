// function sum() {
//     sum = 0;
//     for(let i = 0; i < arguments.length; i++) {
//         sum += arguments[i];
//     }
//     return sum;
// }


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
    
    
    
    function curriedSum(numArgs) {
      let numbers = [];
      
      return function _curriedSum(num) {
        numbers.push(num);
        if (numbers.length === numArgs) {
          return numbers.reduce((acc, el) => acc + el);
        }
        else { return _curriedSum; }
      };
    }
    
    const new_sum = curriedSum(4);
    console.log(new_sum(5)(30)(20)(1)); // => 56
    
    
    Function.prototype.curry = function(numArgs) {
      let finalArgs = [];
      const that = this;
      
      return function _curry(...args) {
        finalArgs.concat(args);
        if (finalArgs.length === numArgs) {
          return this.apply(that, finalArgs);
        }
        else { return _curry; }
      };
    };
    
    function sum(... args) {
        sum = 0;
        for(let i = 0; i < args.length; i++) {
            sum += args[i];
        }
        return sum;
    }
    console.log(sum.curry);
    console.log(sum(1,2,3,4,6)); // = 16

    let newCurriedSum = sum.curry(4);
    console.log(newCurriedSum(5)(30)(20)(1)); // => 56