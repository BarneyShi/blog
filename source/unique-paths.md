---
title: Leetcode 62 - Unique paths
date: 2021-08-31 00:15:14
tags:
- leetcode
- dp
---
**`Note`:** 
- The DP formula is `DP[i][j] = DP[i-1][j] + DP[i][j-1]`; 
- Every element in this 2D array means how many paths there are from `[0][0]` to `[i][j]`. 
- To initialize our array, we just need to fill the `first row` and `col` with `1` because there is only `1` way from `(0,0)` to those places.

A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

How many possible unique paths are there?

**Example 1:**

![img](https://assets.leetcode.com/uploads/2018/10/22/robot_maze.png)
```
Input: m = 3, n = 7
Output: 28
```
```javascript
/**
 * @param {number} m
 * @param {number} n
 * @return {number}
 */
var uniquePaths = function(m, n) {
  let dp = [...Array(m)].map(e => Array(n));
  for (let i = 0; i < m; i++) {
    dp[i][0] = 1;
  }
  for (let j = 0; j < n; j++) {
    dp[0][j] = 1;
  }
  for (let k = 1; k < m; k++) {
    for (let l = 1; l <n; l++) {
      dp[k][l] = dp[k][l-1] + dp[k-1][l];
    }
  }
  return dp[m-1][n-1];
};
```