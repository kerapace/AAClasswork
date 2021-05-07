Array.prototype.myEach = function (callback) {
    for(let i = 0; i < this.length; i ++) {
        callback(this[i]);
    }
}

Array.prototype.myMap = function (callback) {
    let newArr = [];
    this.myEach(el => newArr.push(callback(el)));
    return newArr;
}

Array.prototype.myReduce = function (callback, initialValue) {
    let arr = this;
    if (initialValue === undefined) {
        initialValue = arr[0];
        arr = arr.slice(1);
    }
    let result = initialValue;
    arr.myEach(x => result = callback(result,x));
    return result;
}

