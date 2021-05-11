const Asteroid = require("./asteroid");
const Util = require("./utils");
const Ship = require("./ship.js");

const DIM_X = 800;
const DIM_Y = 600;
const NUM_ASTEROIDS = 1;

function Game(ctx) {
  this.asteroids = this.addAsteroids();
  this.context = ctx;
  this.ship = new Ship();
}

Game.prototype.addAsteroids = function() {
  let ast = [];
  for (let i = 0; i < NUM_ASTEROIDS; i++) {
    ast.push(new Asteroid({pos: this.randomPosition()}));
  }
  return ast;
};

Game.prototype.randomPosition = function() {
  return [Math.floor(Math.random()*DIM_X), Math.floor(Math.random()*DIM_Y)];
};

Game.prototype.moveObjects = function() {
  let allObjs = this.allObjects();
  for(let i = 0; i < allObjs.length; i++) {
    allObjs[i].move();
  }
};

Game.prototype.draw = function() {
  this.context.clearRect(0,0,DIM_X,DIM_Y);
  this.context.fillStyle = "#222";
  this.context.fillRect(0,0,DIM_X,DIM_Y);
  let allObjs = this.allObjects();
  for(let i = 0; i < allObjs.length; i++) {
    this.wrap(allObjs[i].pos);
    allObjs[i].draw(this.context);
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

Game.prototype.checkCollisions = function() {
  let allObjs = this.allObjects();
  for (let i = 0; i < allObjs.length-1; i++) {
    for (let j = i+1; j < allObjs.length-1; j++) {
      if (allObjs[i].isCollidedWith(allObjs[j])) {
        this.collide(allObjs[i],allObjs[j]);
      }
    }
  }
};

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
};

Game.prototype.remove = function(asteroid) {
  const index = this.asteroids.indexOf(asteroid);
  this.asteroids.splice(index,1);
};

Game.prototype.collide = function(mo1,mo2) {
  if(mo1.isCollidedWith(mo2)) {
    for (let i = 0; i < arguments.length; i++) {
      if (!(arguments[i] instanceof Ship)) {
        this.remove(arguments[i]);
      } else {
        this.relocate(arguments[i]);
      }
    }
  }
};

Game.prototype.relocate = function(obj) {
  obj.pos = this.randomPosition();
};

Game.prototype.allObjects = function() {
  return this.asteroids.concat([this.ship]);
};

module.exports = Game;