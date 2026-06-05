---
title: Leetcode 342 - Power of 4
date: 2021-11-09 17:13:55
tags:
- math
---
**`Note:`**
- Because `n == 4^x == 2^2x`, we can do a square root then use `lowbit`.

**`Question:`**

Given an integer `n`, return `true` if it is a `power of four`. Otherwise, return false.

An integer n is a power of four, if there exists an integer x such that `n == 4x`.

**`Example:`**
```
Input: n = 16
Output: true
```

**`Code:`**

**`Math O(1)`**
```javascript
/**
 * @param {number} n
 * @return {boolean}
 */
var isPowerOfFour = function(n) {
  return n > 0 && (Math.sqrt(n) & -1*Math.sqrt(n)) === Math.sqrt(n);
};
```