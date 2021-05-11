import Level from './level';

export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
    this.level = new Level(this.dimensions);
  }

  animate() {
    this.level.animate();
  }

  restart() {
    newLevel = new Level(this.dimensions);
    this.level = newLevel;
    this.animate();
  }
}
