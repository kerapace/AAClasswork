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

  const readline = require('readline');

  const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

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
