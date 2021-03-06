import { htmlGenerator } from './warmup.js';
const clockElement = document.getElementById('clock');

class Clock {
    constructor() {
        const date = new Date();
        this.hours = date.getHours();
        this.minutes = date.getMinutes();
        this.seconds = date.getSeconds();
        this.tick = this._tick.bind(this);
        setInterval(this.tick, 1000);
        this.printTime();
    }
    
    printTime() {
        let form_hours = ("0" + this.hours).slice(-2);
        let form_minutes = ("0" + this.minutes).slice(-2);
        let form_seconds = ("0" + this.seconds).slice(-2);
        htmlGenerator(`${form_hours}:${form_minutes}:${form_seconds}`, clockElement);
    }
    
    _tick() {
        this.seconds += 1;
        if (this.seconds === 60) {
            this.seconds = 0;
            this.minutes += 1;
        }
        if (this.minutes === 60) {
            this.minutes = 0;
            this.hours += 1;
        }
        if (this.hours === 24) {
            this.hours = 0;
        }
        this.printTime()
    }
}

const clock = new Clock();