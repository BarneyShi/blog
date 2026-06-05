---
title: Leetcode 63 - Unique path II
date: 2021-08-31 01:55:27
tags:
- leetcode
- dp
- medium
---
A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

Now consider if some obstacles are added to the grids. How many unique paths would there be?

An obstacle and space is marked as 1 and 0 respectively in the grid.

**Example 1:** 

![img](https://assets.leetcode.com/uploads/2020/11/04/robot1.jpg)
```
Input: obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]
Output: 2
Explanation: There is one obstacle in the middle of the 3x3 grid above.
There are two ways to reach the bottom-right corner:
1. Right -> Right -> Down -> Down
2. Down -> Down -> Right -> Right
```

**`Note:`** 
- The DP formula is `DP[i][j] = DP[i-1][j] + DP[i][j-1]` when `obstacleGrid[i][j] === 0`; 
- Every element in this 2D array means how many paths there are from `[0][0]` to `[i][j]`. 
- To initialize our array, we just need to fill the `first row` and `col` with `0` first, then we would iterate them and replace by `1` if `obstacleGrid[i][j] === 0` because if there is an obstacle on the gird, there is no way to get to the exit.

```javascript
/**
 * @param {number[][]} obstacleGrid
 * @return {number}
 */
var uniquePathsWithObstacles = function(obstacleGrid) {
  const m = obstacleGrid.length;
  const n = obstacleGrid[0].length;
  
  let dp = [...Array(m)].map(e => Array(n).fill(0));
  for (let i = 0; i < m && obstacleGrid[i][0] === 0; i++) {
    if (obstacleGrid[i][0] === 0) {
      dp[i][0] = 1;
    }
  }
  for (let j = 0; j < n && obstacleGrid[0][j] === 0; j++) {
    if (obstacleGrid[0][j] === 0) {
      dp[0][j] = 1;
    }
  }
  for (let k = 1; k < m; k++) {
    for (let l = 1; l < n; l++) {
      if (obstacleGrid[k][l] === 1) {
        dp[k][l] = 0;
      } else {
        dp[k][l] = dp[k-1][l] + dp[k][l-1];
      }
    }
  }
  return dp[m-1][n-1];
};
```