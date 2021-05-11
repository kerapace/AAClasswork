const MovingObject = require("./moving_object.js");

document.addEventListener("DOMContentLoaded", function() {
  let canvas = document.getElementById("asteroids-window");
  const ctx = canvas.getContext("2d");
  let mo = new MovingObject({
    pos: [30, 30],
    vel: [10, 10],
    radius: 20,
    color: "#00FF00"
  });
  mo.draw(ctx);
});

console.log("Webpack is working!");