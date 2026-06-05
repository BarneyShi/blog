---
title: Leetcode 867 - Transpose Matrix
date: 2022-01-15 23:07:03
tags:
---
**`Note:`**
- Note that we don't need to find the pattern. Just create a new matrix with original matrix's `rows` as its `cols`, and original matrix's cols as its rows.

**`Question:`**

Given a 2D integer array matrix, return the `transpose` of matrix.

The `transpose` of a matrix is the matrix `flipped` over its main diagonal, switching the matrix's row and column indices.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/02/10/hint_transpose.png)
```
Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [[1,4,7],[2,5,8],[3,6,9]]
```

**`Code:`**
```javascript
/**
 * @param {number[][]} matrix
 * @return {number[][]}
 */
var transpose = function(matrix) {
  const rows = matrix.length;
  const cols = matrix[0].length;
  const ans = [...new Array(cols)].map(e => new Array(rows).fill(0));
  for (let i = 0; i < cols; i++) {
    for (let j = 0; j < rows; j++) {
      ans[i][j] = matrix[j][i];
    }
  }
  return ans;
};
```