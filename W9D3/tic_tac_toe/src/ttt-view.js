const Game = require('./game')

class View {
  constructor(game, $el) {
    this.game = game;
    this.$loc = $el;
    this.$loc.html(this.setupBoard());
    this.bindEvents();
  }

  bindEvents() {
      this.$loc.on("click", "li", event => {
      let el = event.target;
      this.makeMove($(el));
    });
  }

  makeMove($square) {
    if ($square.html() === "" && !this.game.isOver()) {
      $square.html(`<h2>${this.game.currentPlayer}</h2>`);
      this.game.playMove($square.data("pos"));
      const winner = this.game.winner();
      if (winner) {
        $("li").each((idx,el) => {
          let inArray = false;
          let element = $(el);
          let pos = element.data("pos");
          winner[1].forEach(el2 => {if(el2[0] === pos[0] && el2[1] === pos[1]) {inArray = true;}});
          if(inArray) {element.addClass("winning-pos");}
        });
      }
    }
  }

  setupBoard() {
    let $list = $("<ul></ul>");
    $list.addClass('ttt-board');
    for(let i = 0; i < 9; i++) {
      let $ele = $("<li></li>");
      $ele.data("pos", [Math.floor(i/3), i % 3]);
      $list.append($ele);
    }
    return $list;
  }

}

module.exports = View;
