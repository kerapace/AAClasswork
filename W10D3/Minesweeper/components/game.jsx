import React from "react";
import * as Minesweeper from "./minesweeper";
import Board from "./board.jsx";

const defaultParams = [16,48];

export default class Game extends React.Component{
  constructor(props) {
    super(props);
    this.state = {
      board: new Minesweeper.Board(...defaultParams)
    }
    this.updateGame = this.updateGame.bind(this);
    this.restartGame = this.restartGame.bind(this);
  }

  updateGame(pos,event){
    const [i, j] = pos;
    const temp = this.state.board;
    if (event.type == "contextmenu") {
      event.preventDefault();
      temp.grid[i][j].toggleFlag();
    }
    else if (event.type == "click") {
      temp.grid[i][j].explore();
      if(temp.grid[i][j].bombed) {temp.revealAll();}
    }
    this.setState({
      board: temp
    });
  }

  restartGame(event) {
    event.preventDefault();
    this.setState({board: new Minesweeper.Board(...defaultParams)});
  }

  render() {
    return (
      <div className="game-container">
        <Board board={this.state.board} update={this.updateGame}/>
        <button onClick={(e) => this.restartGame(e)}>Restart Game</button>
      </div>
    );
  }
}