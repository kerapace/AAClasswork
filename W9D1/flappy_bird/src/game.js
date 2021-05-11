import Level from './level';

export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
    this.level = new Level(this.dimensions);
  }

  animate(ctx) {
    this.level.animate(ctx);
  }

  restart() {
    let newLevel = new Level(this.dimensions);
    this.level = newLevel;
    this.animate(this.ctx);
  }
}
