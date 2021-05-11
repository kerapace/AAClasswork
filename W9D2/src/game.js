const Asteroid = require("./asteroid");
const Util = require("./utils");

const DIM_X = 800;
const DIM_Y = 600;
const NUM_ASTEROIDS = 10;
function Game(ctx) {
  this.asteroids = this.addAsteroids();
  this.context = ctx;
}

Game.prototype.addAsteroids = function() {
  let ast = []
  for (let i = 0; i < NUM_ASTEROIDS; i++) {
    ast.push(new Asteroid({pos: this.randomPosition()}));
  }
  return ast;
}

Game.prototype.randomPosition = function() {
  return [Math.random()*DIM_X, Math.random()*DIM_Y];
}

Game.prototype.moveObjects = function() {
  for(let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].move();
  }
}

Game.prototype.draw = function() {
  this.context.clearRect(0,0,DIM_X,DIM_Y);
  this.context.fillStyle = "#222";
  this.context.fillRect(0,0,DIM_X,DIM_Y);
  for(let i = 0; i < this.asteroids.length; i++) {
    this.wrap(this.asteroids[i].pos);
    this.asteroids[i].draw(this.context);
  }
};

Game.prototype._XInsideWindow = function(pos) {
  return pos[0] >= -50 && pos[0] <= DIM_X + 50;
};

Game.prototype._YInsideWindow = function(pos) {
  return pos[1] >= -50 && pos[1] <= DIM_Y + 50;
};

Game.prototype.wrap = function(pos) {
  if(!this._XInsideWindow(pos)) {
    pos[0] = Util.goodModulus(pos[0]+50,DIM_X+100) - 50;
  }
  if(!this._YInsideWindow(pos)) {
    pos[1] = Util.goodModulus(pos[1]+50,DIM_Y+100) - 50;
  }
};

module.exports = Game;