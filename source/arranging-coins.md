---
title: Leetcode 441 - Arranging coins
date: 2021-10-27 19:42:49
tags:
---
**`Note:`**
- Use math `(root = sqrt(8n - 1) - 1 ) / 2`.

**`Question:`**

You have `n` coins and you want to build a staircase with these coins. The staircase consists of `k` rows where the `ith` row has exactly `i` coins. The last row of the staircase may be incomplete.

Given the integer `n`, return the number of complete rows of the staircase you will build.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/04/09/arrangecoins1-grid.jpg)
```
Input: n = 5
Output: 2
Explanation: Because the 3rd row is incomplete, we return 2.
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @return {number}
 */
var arrangeCoins = function(n) {
  for (let i = n; i >= 0; i--) {
    const root = Math.sqrt(8*i + 1)
    if ((root - 1) % 2 === 0) {
      return (root - 1) / 2;
    }
  }
};
```