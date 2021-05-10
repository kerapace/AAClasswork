Function.prototype.inherits = function(superclass,subclass) {
  subclass.prototype = Object.create(superclass.prototype);
  subclass.prototype.constructor = subclass;
};

function Cat(breed) {
  this.breed = breed;
}

function Animal() {
  this.species = "idk";
}

Animal.prototype.eat = function() {console.log("eat!");}

Function.prototype.inherits(Animal,Cat);
cat1 = new Cat("tortoiseshell");
cat1.eat();

