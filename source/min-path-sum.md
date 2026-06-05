---
title: Leetcode 64 - Min path sum
date: 2021-11-23 20:51:33
tags:
- dfs
- dp
---
**`Note:`**
- `DFS`
  - Don't worry about visiting a visited cell coz we use `memo` to remmeber the min path that goes through this cell.
- `DP`
  - `dp[i][j] = grid[i][j] + min(dp[i-1][j], dp[i][j-1])`
  - Intialize `first row` and `first col` coz they don't fit above deduction.

**`Question:`**

Given a `m x n` grid filled with non-negative numbers, find a path from `top left` to `bottom right`, which minimizes the sum of all numbers along its path.

Note: You can only move either `down` or `right` at any point in time.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/11/05/minpath.jpg)
```
Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
Output: 7
Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.
```

**`Code:`**

**`DFS`**
```javascript
/**
 * @param {number[][]} grid
 * @return {number}
 */
var minPathSum = function(grid) {
  const rows = grid.length;
  const cols = grid[0].length;
  let dp = [... new Array(rows)].map(e => new Array(cols).fill(Infinity));
  dp[0][0] = grid[0][0];
  for (let i = 1; i < rows; i++) {
    dp[i][0] = dp[i-1][0] + grid[i][0];
  }
  for (let j = 1; j < cols; j++) {
    dp[0][j] = dp[0][j-1] + grid[0][j];
  }

  for (let i = 1; i < rows; i++) {
    for (let j = 1; j < cols; j++) {
      dp[i][j] = Math.min(dp[i-1][j], dp[i][j-1]) + grid[i][j];
    }
  }
  return dp[rows-1][cols-1];
};
```