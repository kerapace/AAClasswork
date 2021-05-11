function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 360);
  ctx.fillStyle = this.color;
  ctx.fill();
};

MovingObject.prototype.move = function() {
  this.pos = [this.pos[0]+this.vel[0],this.pos[1]+this.vel[1]];
};

MovingObject.prototype.isCollidedWith = function(otherObj) {
  return this.distanceBetween(otherObj) < this.radius + otherObj.radius;
};

MovingObject.prototype.distanceBetween = function(otherObj) {
  let [x1, y1] = [this.pos[0], this.pos[1]];
  let [x2, y2] = [otherObj.pos[0], otherObj.pos[1]];
  return Math.sqrt( (x1-x2)**2 + (y1-y2)**2 );
};

module.exports = MovingObject;