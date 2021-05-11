const Game = require("./game");
const Util = require("./utils");

function GameView(ctx) {
  this.game = new Game(ctx);
  this.context = ctx;
}

GameView.prototype.start = function() {
  setInterval(this.game.draw.bind(this.game),20);
  setInterval(this.game.moveObjects.bind(this.game),20);
};

module.exports = GameView;