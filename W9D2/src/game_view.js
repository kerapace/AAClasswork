const Game = require("./game");
const Util = require("./utils");
const Ship = require("./ship");

function GameView(ctx) {
  this.game = new Game(ctx);
  this.context = ctx;
  this.bindKeyHandlers();
}

GameView.prototype.start = function() {
  setInterval(this.game.draw.bind(this.game),20);
  setInterval(this.game.step.bind(this.game),20);
};

GameView.prototype.bindKeyHandlers = function() {
  key('w',function() {this.power([0,1]);}.bind(this.game.ship));
  key('a',function() {this.power([-1,0]);}.bind(this.game.ship));
  key('s',function() {this.power([0,-1]);}.bind(this.game.ship));
  key('d',function() {this.power([1,0]);}.bind(this.game.ship));
};

module.exports = GameView;