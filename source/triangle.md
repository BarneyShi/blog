---
title: Leetcode 120 - Triangle
date: 2021-11-27 22:55:35
tags:
- dfs
- memorization
---
**`Note:`**
- Use recursion with memo
  - Base case: `i >= rows`, return 0.
  - Return type: sum of path, a num
  - What to do: Find the min between two recursion calls.

**`Question:`**

Given a `triangle` array, return the minimum path sum from top to bottom.

For each step, you may move to an adjacent number of the row below. More formally, if you are on index i on the current row, you may move to either index `i` or index `i + 1` on the next row.

**`Example:`**
```
Input: triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
Output: 11
Explanation: The triangle looks like:
   2
  3 4
 6 5 7
4 1 8 3
The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11 (underlined above).
```

**`Code:`**

**`O(n^2) because every num is iterated once. There are 1 + 2 + ... + n = O(n^2)`**
```javascript
/**
 * @param {number[][]} triangle
 * @return {number}
 */
var minimumTotal = function(triangle) {
  let memo = {};
  const rows = triangle.length;
  return dfs(0, 0, triangle);

  function dfs(i, j, triangle) {
    if (i >= rows) return 0;
    if (memo[i + '.' + j] !== undefined) return memo[i + '.' + j];
    const res = triangle[i][j] + Math.min(dfs(i + 1, j, triangle), dfs(i + 1, j + 1, triangle));
    memo[i + '.' + j] = res;
    return memo[i + '.' + j];
  }
};
```