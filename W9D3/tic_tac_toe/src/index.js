const View = require('./ttt-view');
const Game = require('./game');

  const resetGame = function () {
    const game = new Game();
    const gameContainer = $('figure.ttt');
    const view = new View(game,gameContainer);
    
  }


  $(() => {
   resetGame();
   const $button = $("#reset");
   $button.on("click", () => {
      resetGame();
    });
  });
