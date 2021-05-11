// Function.prototype.inherits = function(parentClass) {
//   function Surrogate() {}
//   Surrogate.prototype = parentClass.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
// };

const Util = {
  inherits: function(subClass,parentClass) {
    function Surrogate() {}
    Surrogate.prototype = parentClass.prototype;
    subClass.prototype = new Surrogate();
    subClass.prototype.constructor = subClass;
  },

  randomVec: function(length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },
  // Scale the length of a vector by the given amount.
  scale: function(vec, m) {
    return [vec[0] * m, vec[1] * m];
  },

  randomAsteroidSize: function() {
    return 15 + 35 * Math.random();
  },

  goodModulus: function(x,y) {
    return ((x % y) + y) % y;
  }
}

module.exports = Util;