---
title: Leetcode 304 - Range sum query 2D - Immutable
date: 2021-12-02 19:49:18
tags:
---
**`Note:`**
- Use `preSum`.
- What is `preSum` in 2D? The sum of cells between `[0, 0]` and `[i, j]`.
- How initialize `preSum[][]`?
  - ![img](https://i.imgur.com/iivmJsZ.png)
  - Also we need to another an extra `row` and `col` and fill them with `0`.
- How to find calc `sum[i][j]`?
  - Just like how we initialized `preSum` but remember to add `offset 1` to every `row` and `col` because there are an axtra row and col.

**`Question:`**

Given a `2D` matrix matrix, handle multiple queries of the following type:

- Calculate the sum of the elements of `matrix` inside the rectangle defined by its upper left corner `(row1, col1)` and lower right corner `(row2, col2)`.

Implement the NumMatrix class:

- `NumMatrix(int[][] matrix)` Initializes the object with the integer matrix matrix.
- `int sumRegion(int row1, int col1, int row2, int col2)` Returns the sum of the elements of matrix inside the rectangle defined by its upper left corner `(row1, col1)` and lower right corner `(row2, col2)`.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/03/14/sum-grid.jpg)
```
Input
["NumMatrix", "sumRegion", "sumRegion", "sumRegion"]
[[[[3, 0, 1, 4, 2], [5, 6, 3, 2, 1], [1, 2, 0, 1, 5], [4, 1, 0, 1, 7], [1, 0, 3, 0, 5]]], [2, 1, 4, 3], [1, 1, 2, 2], [1, 2, 2, 4]]
Output
[null, 8, 11, 12]

Explanation
NumMatrix numMatrix = new NumMatrix([[3, 0, 1, 4, 2], [5, 6, 3, 2, 1], [1, 2, 0, 1, 5], [4, 1, 0, 1, 7], [1, 0, 3, 0, 5]]);
numMatrix.sumRegion(2, 1, 4, 3); // return 8 (i.e sum of the red rectangle)
numMatrix.sumRegion(1, 1, 2, 2); // return 11 (i.e sum of the green rectangle)
numMatrix.sumRegion(1, 2, 2, 4); // return 12 (i.e sum of the blue rectangle)
```

**`Code:`**
```javascript
/**
 * @param {number[][]} matrix
 */
var NumMatrix = function(matrix) {
  const m = matrix.length;
  const n = matrix[0].length;
  this.preSum = [...Array(m + 1)].map(e => Array(n + 1).fill(0));
  for (let i = 1; i <= m; i++) {
    for (let j = 1; j <= n; j++) {
      this.preSum[i][j] = matrix[i - 1][j - 1] + this.preSum[i-1][j] + this.preSum[i][j-1] - this.preSum[i-1][j-1];
    }
  }
};

/** 
 * @param {number} row1 
 * @param {number} col1 
 * @param {number} row2 
 * @param {number} col2
 * @return {number}
 */
NumMatrix.prototype.sumRegion = function(row1, col1, row2, col2) {
  return this.preSum[row2 + 1][col2 + 1] - (this.preSum[row1 - 1 + 1][col2 + 1] + this.preSum[row2 + 1][col1 - 1 + 1] - this.preSum[row1 - 1 + 1][col1 - 1 + 1]);
};

/**
 * Your NumMatrix object will be instantiated and called as such:
 * var obj = new NumMatrix(matrix)
 * var param_1 = obj.sumRegion(row1,col1,row2,col2)
 */
```