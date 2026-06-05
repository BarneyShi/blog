---
title: Leetcode 70 - Climbing stairs
date: 2021-08-30 00:35:18
tags:
- leetcode
- dp
---
**Note:** Just like fibonacci numbers.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

**Example 1:**
```
Input: n = 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps
```
```javascript
/**
 * @param {number} n
 * @return {number}
 */
var climbStairs = function(n) {
  if (n <= 1) return n;
  let ans = [];
  ans[1] = 1;
  ans[2] = 2;
  for (let i = 3; i <= n; i++) {
    ans[i] = ans[i-1] + ans[i-2];
  }
  return ans[n];
};
```
