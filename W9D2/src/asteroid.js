const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");

function Asteroid(options) {
  this.pos = options.pos;
  this.vel = Util.randomVec(1);
  this.radius = options.radius || Util.randomAsteroidSize();
  this.color = options.color || "#997e5d";
}