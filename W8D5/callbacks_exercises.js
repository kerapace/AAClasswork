class Clock {
    constructor() {
      // 1. Create a Date object.
      // 2. Store the hours, minutes, and seconds.
      // 3. Call printTime.
      // 4. Schedule the tick at 1 second intervals.
      const date = new Date();
      this.hours = date.getHours();
      this.minutes = date.getMinutes();
      this.seconds = date.getSeconds();
      this.tick = this._tick.bind(this);
      setInterval(this.tick, 1000);
    }
  
    printTime() {
      // Format the time in HH:MM:SS
        // Use console.log to print it.
      let form_hours = ("0" + this.hours).slice(-2);
      let form_minutes = ("0" + this.minutes).slice(-2);
      let form_seconds = ("0" + this.seconds).slice(-2);
      console.log(`${form_hours}:${form_minutes}:${form_seconds}`);
    }
  
    _tick() {
      // 1. Increment the time by one second.
      // 2. Call printTime.
      this.seconds += 1;
      if(this.seconds === 60) {
          this.seconds = 0;
          this.minutes += 1;
      }
      if(this.minutes === 60) {
        this.minutes = 0;
        this.hours += 1;
      }
      if(this.hours === 24) {
          this.hours = 0;
      }
      this.printTime()
    }
  }
  
  // const clock = new Clock();

//   const readline = require('readline');

//   const reader = readline.createInterface({
//     input: process.stdin,
//     output: process.stdout
//   });

  function addNumbers (sum, numsLeft, completionCallback) {
    if (numsLeft > 0) {
      reader.question('Enter a number', function (newNum) {
        let num = parseInt(newNum);
        sum += num;
        console.log(sum);
        addNumbers(sum, numsLeft - 1, completionCallback);
      });
    }else {
      completionCallback(sum);
      reader.close()
    }
  }

  // addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

  const readline = require('readline');

  const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

  function askIfGreaterThan(ele1, ele2, callback) {
      reader.question(`Is ${ele1} greater than ${ele2}?\n`, function(output) {
        if(output==="yes") {
            callback(true);
        }
        else if (output==="no") {
            callback(false);
        }
        else {
            askIfGreaterThan(ele1,ele2,callback);
        }
      });
  }
   // sorted 

  function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
        if(i < arr.length - 1) {
          askIfGreaterThan(arr[i],arr[i+1], (bool) => {
                if(bool) {
                    [arr[i], arr[i+1]] = [arr[i+1],arr[i]];
                    madeAnySwaps = true;
                }
                innerBubbleSortLoop(arr,i+1,madeAnySwaps,outerBubbleSortLoop);
            });
        }
        else {
            outerBubbleSortLoop(madeAnySwaps);
        }
  }

//   innerBubbleSortLoop([2,1,3,4,5],0,false,(bool) => console.log('hello!'));


  

  function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {
        if(!madeAnySwaps) {
            sortCompletionCallback(arr);
        }
        else {
            innerBubbleSortLoop(arr,0,false,outerBubbleSortLoop);
        }
    }
    outerBubbleSortLoop(true);
  }

    // absurdBubbleSort([5,4,3,2,1], (arr) => {
    //     console.log(arr);
    //     reader.close();
    // });


    Function.prototype.myBind = function(context) {
        return () => {
            this.apply(context)
        };
    }

    class Lamp {
        constructor() {
          this.name = "a lamp";
        }
      }
      
    const turnOn = function() {
    console.log("Turning on " + this.name);
    };
    
    // const lamp = new Lamp();
    
    // turnOn(); // should not work the way we want it to
    
    // const boundTurnOn = turnOn.bind(lamp);
    // const myBoundTurnOn = turnOn.myBind(lamp);
    
    // boundTurnOn(); // should say "Turning on a lamp"
    // myBoundTurnOn(); // should say "Turning on a lamp"


    Function.prototype.myThrottle = function (interval) {
      let tooSoon = false; 
      return (...args) => { 
        if (tooSoon) {}

        else {
          tooSoon = true;
          setTimeout(() => {tooSoon = false;}, interval);
          this.call(...args)
        }

      };
    };

    
    class Neuron {
      fire() {
        console.log("Firing!");
      }
    }
    
    // const neuron = new Neuron();

    // neuron.fire = neuron.fire.myThrottle(500);

    // const interval = setInterval(() => {
    //   neuron.fire();
    // }, 10);


    Function.prototype.myDebounce = function (interval) {
      let timeOut = setTimeout(() => {this.call()}, interval);
      return () => { 
            clearTimeout(timeOut);
            timeOut = setTimeout(() => {this.call()}, interval);
        };
      };

    class SearchBar {
        constructor() {
          this.query = "";
      
          this.type = this.type.bind(this);
          this.search = this.search.bind(this);
        }
      
        type(letter) {
          this.query += letter;
          this.search();
        }
      
        search() {
          console.log(`searching for ${this.query}`);
        }
    }

    const searchBar = new SearchBar();

    searchBar.search = searchBar.search.myDebounce(500);

    const queryForHelloWorld = () => {
    searchBar.type("h");
    searchBar.type("e");
    searchBar.type("l");
    searchBar.type("l");
    searchBar.type("o");
    searchBar.type(" ");
    searchBar.type("w");
    searchBar.type("o");
    searchBar.type("r");
    searchBar.type("l");
    searchBar.type("d");
    };

    queryForHelloWorld();