Array.prototype.uniq = function() {
    uniqElements = [];
    for(let i = 0; i < this.length; i++) {
        if (!uniqElements.includes(this[i])) {
            uniqElements.push(this[i])  
        }
    }
    return uniqElements;
}

// function uniq(arr) {
//     newArr = []
//     for(let i = 0; i < arr.length; i++) {
//         if (!newArr.includes(arr[i])) {
//             newArr.push(arr[i])
//         }
//     }
//     return newArr;
// }

Array.prototype.twoSum = function() {
    let pairs = [];
    for(let i = 0; i < this.length; i++) {
        for(let j = 0; j < this.length; j++) {
            if(this[i]+this[j] === 0) {
                pairs.push([i,j])
            }
        }
    }
    return pairs;
}

Array.prototype.transpose = function() {
    return this[0].map((column,i) => this.map(row => row[i]));
}
