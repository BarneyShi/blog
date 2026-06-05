---
title: Leetcode 566 - Reshape the matrix
date: 2021-12-05 00:08:21
tags:
---
**`Note:`**
- First, project `m * n` elements to a `1D` array with size `m * n`. 
- By our prev knowledge, it's `i * n + j`.
- Then, iterate through this array from `0` to `m * n - 1`.
- Put every element to our new array by `i * c + j`.

**`Question:`**

In MATLAB, there is a handy function called `reshape` which can reshape an `m x n` matrix into a new one with a different size `r x c` keeping its original data.

You are given an `m x n` matrix mat and two integers `r` and `c` representing the number of rows and the number of columns of the wanted reshaped matrix.

The reshaped matrix should be filled with all the elements of the original matrix in the same row-traversing order as they were.

If the `reshape` operation with given parameters is possible and legal, output the new reshaped matrix; Otherwise, output the `original` matrix.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/04/24/reshape1-grid.jpg)
```
Input: mat = [[1,2],[3,4]], r = 1, c = 4
Output: [[1,2,3,4]]
```

**`Code:`**

**`2D to 1D`**
```javascript
/**
 * @param {number[][]} mat
 * @param {number} r
 * @param {number} c
 * @return {number[][]}
 */
var matrixReshape = function(mat, r, c) {
  const rows = mat.length;
  const cols = mat[0].length;
  if (rows * cols !== r * c) return mat;
  let reshaped = [...Array(r)].map(e => Array(c).fill(0));
  for (let i = 0; i < rows * cols; i++) {
    reshaped[Math.floor(i / c)][i % c] = mat[Math.floor(i / cols)][i % cols];
  }
  return reshaped;
};
```

**`Method 2`**
```javascript
/**
 * @param {number[][]} mat
 * @param {number} r
 * @param {number} c
 * @return {number[][]}
 */
var matrixReshape = function(mat, r, c) {
  const rows = mat.length;
  const cols = mat[0].length;
  if (rows * cols !== r * c) return mat;
  let reshaped = [...Array(r)].map(e => Array(c).fill(0));
  for (let i = 0; i < r; i++) {
    for (let j = 0; j < c; j++) {
      const first = mat[0];
      if (first.length > 0) {
        const next = mat[0].shift();
        reshaped[i][j] = next;
      } else {
        mat.shift();
        const next = mat[0].shift();
        reshaped[i][j] = next;
      }
    }
  }
  return reshaped;
};
```