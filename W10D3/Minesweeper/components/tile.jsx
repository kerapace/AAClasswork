import React from "react";

const Tile = (props) => {
  let display = "";

  if(props.tile.explored){
    if(props.tile.bombed){
      display = "💣"
    }else{
      display += props.tile.adjacentBombCount();
    }
  }else if (props.tile.flagged){
    display = "🚩"
  }else{
    display = "⬜️";
  }

  return (
    <div className = "tile" onClick={(e) => props.update(props.tile.pos,e)} onContextMenu={(e) => props.update(props.tile.pos,e)}><p>{display}</p></div>
  )
}

export default Tile;