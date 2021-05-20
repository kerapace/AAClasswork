import React from "react";
import Tile from "./tile.jsx";

const Board = (props) => 
  (<div className="board-container">
    {props.board.grid.map((row,row_num) =>
      (<div key={row_num} className="row-container">
        {row.map((tile,col_num) => (<Tile tile={tile} key={col_num} update={props.update}/>))}
      </div>)
    )}
  </div>);

export default Board;