const Asteroid = require("./asteroid");

const DIM_X = 800;
const DIM_Y = 600;
const NUM_ASTEROIDS = 10;
function Game() {
  this.asteroids = this.addAsteroids();
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

Game.prototype.moveObject = function() {
  
}

module.exports = Game;