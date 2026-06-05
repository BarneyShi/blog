---
title: Leetcode 598 - Range addition II
date: 2021-11-06 22:18:58
tags:
---
**`Note:`**
- Find the overlap of all rectangles.

**`Question:`**

You are given an `m x n` matrix `M` initialized with all 0's and an array of operations ops, where `ops[i] = [ai, bi]` means M[x][y] should be incremented by one for all `0 <= x < ai` and `0 <= y < bi`.

Count and return the number of maximum integers in the matrix after performing all the operations.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/10/02/ex1.jpg)
```
Input: m = 3, n = 3, ops = [[2,2],[3,3]]
Output: 4
Explanation: The maximum integer in M is 2, and there are four of it in M. So return 4.
```

**`Code:`**
```javascript
/**
 * @param {number} m
 * @param {number} n
 * @param {number[][]} ops
 * @return {number}
 */
var maxCount = function(m, n, ops) {
  let row = Infinity, col = Infinity;
  for (let i = 0; i < ops.length; i++) {
    row = Math.min(ops[i][0], m, row);
    col = Math.min(ops[i][1], n, col);
  }
  return row * col === Infinity ? m*n : row * col;
};
```