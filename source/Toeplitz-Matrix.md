---
title: Leetcode 766 - Toeplitz Matrix
date: 2021-12-28 03:48:09
tags:
---
**`Note:`**
- A straightforward problem. Just compare diagonal grids.

**`Question:`**

Given an `m x n` matrix, return true if the matrix is Toeplitz. Otherwise, return `false`.

A `matrix` is `Toeplitz` if every diagonal from `top-left` to `bottom-right` has the same `elements`.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/11/04/ex1.jpg)
```
Input: matrix = [[1,2,3,4],[5,1,2,3],[9,5,1,2]]
Output: true
Explanation:
In the above grid, the diagonals are:
"[9]", "[5, 5]", "[1, 1, 1]", "[2, 2, 2]", "[3, 3]", "[4]".
In each diagonal all elements are the same, so the answer is True.
```

**`Code:`**
```javascript
/**
 * @param {number[][]} matrix
 * @return {boolean}
 */
var isToeplitzMatrix = function(matrix) {
  const rows = matrix.length;
  const cols = matrix[0].length;
  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      if (i !== 0 && j !== 0) continue;
      let nx = i;
      let ny = j;
      while (nx < rows && ny < cols) {
        if (matrix[i][j] !== matrix[nx][ny]) return false;
        nx++;
        ny++;
      }
    }
  }
  return true;
};
```