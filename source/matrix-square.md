---
title: Leetcode 221 - Matrix square
date: 2021-12-01 17:52:50
tags:
- dp
---
**`Note:`**
- Why is it a `dp` question? Current sqaure might overlap with prev squares, so `dp[i][j]` def has some relations to `dp[i-1][j-1]`.
- What does `dp[i][j]` represent?
  - Make `[i, j]` `bottom right` of the square.
- How to know the deduction?
  - ![img](https://i.imgur.com/cZrpeJt.png)
  - The side of the sqaure at `dp[i][j] = 1 + min(dp[i - 1][j - 1], dp[i][j - 1], dp[i - 1][j])`.
  - `0` if `matrix[i][j] === 0.

**`Question:`**

Given an `m x n` binary matrix filled with `0`'s and `1`'s, find the largest square containing only 1's and return its area.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/11/26/max1grid.jpg)
```
Input: matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
Output: 4
```

**`Code:`**
```javascript
/**
 * @param {character[][]} matrix
 * @return {number}
 */
var maximalSquare = function(matrix) {
  const rows = matrix.length;
  const cols = matrix[0].length;
  let dp = [...Array(rows)].map(e => Array(cols).fill(0));
  let res = 0;
  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      if (i === 0 && matrix[i][j] === '1' || j === 0 && matrix[i][j] === '1') {
        dp[i][j] = 1;
        res = 1;
      }
    }
  }
  for (let i = 1; i < rows; i++) {
    for (let j = 1; j < cols; j++) {
      const length = matrix[i][j] === '0' ? 0 : Math.min(dp[i - 1][j - 1], dp[i][j - 1], dp[i - 1][j]) + 1;
      dp[i][j] = length;
      res = Math.max(res, dp[i][j]**2)
    }
  }
  return res;
};
```