function range(start, end) {
    if (start === end) {
        return [];
    }
    else {
        return [start].concat(range(start + 1, end));
    }
}

function sum_rec(arr) {
    if(arr.length === 0) {
        return 0;
    }
    else {
        return arr + sum_rec(arr.slice(1));
    }
}

function exponent(base, pow) {
    if(pow === 0) {
        return 1;
    }
    else if(pow === 1) {
        return base;
    }
    else {
        return base * exponent(base, pow - 1);
    }
}

function fibonacci(n) {
    if(n===1) {
        return [1];
    }
    if(n===2) {
        return [1,1];
    }
    else {
        let fib = fibonacci(n-1);
        fib.push(fib[fib.length-1]+fib[fib.length-2]);
        return fib;
    }
}

function deepDup(arr) {
    let newArr = [];
    arr.forEach((el) => typeof el === 'array' ? newArr.push(deepDup(el)) : newArr.push(el));
    return newArr;
}

function bsearch(arr, target) {
    if (arr.length === 0) {
        return -1;
    }
    let mid = Math.floor(arr.length / 2);
    let pivot = arr[mid];
    if (target === pivot) {
        return mid;
    } else if (target < pivot) {
        return bsearch(arr.slice(0, mid), target);
    } else {
        let res = bsearch(arr.slice(mid + 1, arr.length), target);
        return res === -1 ? -1 : mid + 1 + res;
    }
}

function mergesort(arr) {
    if (arr.length === 1) {
        return arr;
    }
    let mid = Math.floor(arr.length / 2);
    let left = mergesort(arr.slice(0, mid));
    let right = mergesort(arr.slice(mid, arr.length));
    return merge(left, right);
}

function merge(arr1, arr2) {
    let i = 0;
    let j = 0;
    let arr = [];
    while (i < arr1.length && j < arr2.length) {
        if (arr1[i] <= arr2[j]) {
            arr.push(arr1[i]);
            i++;
        } else {
            arr.push(arr2[j]);
            j++;
        }
    }
    return arr.concat(arr1.slice(i).concat(arr2.slice(j)));
}

function subsets(arr) {
    if(arr.length === 0) {
        return [[]];
    }
    let first = arr[0];
    let rest = subsets(arr.slice(1));
    let concats = rest.map(el => [first].concat(el));
    return concats.concat(rest);
}
