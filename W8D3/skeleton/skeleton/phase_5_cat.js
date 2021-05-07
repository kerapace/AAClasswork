function Cat(name,owner) {
    this.name = name;
    this.owner = owner;
}

Cat.prototype.cuteStatement = function () {
    return `${this.owner} loves ${this.name}!!!!!!!!`;
}

let garfield = new Cat("Garfield","Jon Arbuckle");
let salem = new Cat("Salem","Sabrina");
console.log(garfield.cuteStatement());
console.log(salem.cuteStatement());

Cat.prototype.cuteStatement = function () {
    return `Everyone loves ${this.name}!!!!!!!!`;
}

console.log(garfield.cuteStatement());
console.log(salem.cuteStatement());

Cat.prototype.meow = function () {
    return `Meow. :3`
}

console.log(garfield.meow());

garfield.meow = function () {
    return `ROAR! >:3`
}

console.log(garfield.meow());
console.log(salem.meow());

