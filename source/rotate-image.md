---
title: Leetcode 48 - Rotate image
date: 2021-11-05 15:22:38
tags:
---
**`Note:`**
- Use an array `[prev, cur]` to contain both new and old values.
- Be careful with boundaries, like we should use `row - 1 - i` instead of `row - i`.

**`Question:`**

You are given an `n x n` 2D `matrix` representing an image, rotate the image by `90` degrees (clockwise).

You have to rotate the image `in-place`, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/08/28/mat1.jpg)
```
Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [[7,4,1],[8,5,2],[9,6,3]]
```

**`Code:`**
```javascript
/**
 * @param {number[][]} matrix
 * @return {void} Do not return anything, modify matrix in-place instead.
 */
var rotate = function(matrix) {
  const rows = matrix.length;
  const cols = rows;
  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      if (!isNaN(matrix[i][j])) {
        matrix[j][rows - i - 1] = [matrix[j][rows - i - 1], matrix[i][j]];
      } else {
        matrix[j][rows - i - 1] = [matrix[j][rows - i - 1], matrix[i][j][0]];
      }
    }
  }
  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      matrix[i][j] = matrix[i][j][1];
    }
  }
};
```