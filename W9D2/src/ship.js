const DIM_X = 800;
const DIM_Y = 600;

const Util = require("./utils");
const MovingObject = require("./moving_object");

function Ship(options = {}) {
  this.pos = options.pos || [Math.floor(DIM_X/5),Math.floor(DIM_Y/2)];
  this.vel = [0,0];
  this.radius = 10;
  this.color = "#"+("00"+(Math.floor((16**3)*Math.random())).toString(16)).slice(-3);
}

Ship.prototype.power = function(impulse) {
  [this.vel[0],this.vel[1]] = [this.vel[0] + impulse[0],this.vel[1] + impulse[1]];
};

Util.inherits(Ship,MovingObject);

module.exports = Ship;

