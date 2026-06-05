---
title: Leetcode 54 - Spiral matrix
date: 2021-11-07 00:09:17
tags:
---
**`Note:`**
- `Peel` the matrix like an 🍎 .
- Modify matrix is eaiser.
- Use recursion to pop and add `topRow` first, then `right col most`, then `reversed bottom row`, then `leftmost col`.

**`Question:`**

Given an m x n matrix, return all elements of the matrix in spiral order.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/11/13/spiral1.jpg)
```
Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [1,2,3,6,9,8,7,4,5]
```

**`Code:`**
```javascript
/**
 * @param {number[][]} matrix
 * @return {number[]}
 */
var spiralOrder = function (matrix) {
  let res = [];

  while (matrix.length > 0) {
    let topRow = [];
    let bottomRow = [];

    const top = matrix.shift();
    const bottom = matrix.pop();
    top && topRow.push(...top);
    bottom && bottomRow.push(...bottom.reverse());

    let rightCol = [];
    let leftCol = [];
    for (let i = 0; i < matrix.length; i++) {
      const left = matrix[i].shift();
      const right = matrix[i].pop();
      left && leftCol.unshift(left);
      right && rightCol.push(right);
    }
    res.push(...topRow);
    res.push(...rightCol);
    res.push(...bottomRow);
    res.push(...leftCol);
  }
  return res;
};
```