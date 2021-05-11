const Util = require("./utils");
const RADIUS = 10;

function Bullet(ship) {
  this.pos = [ship.pos[0]+RADIUS, ship.pos[1]];
  this.vel = [5, 0]; 
  this.radius = 2;
  this.color = "#c00";
}