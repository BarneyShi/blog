---
title: Leetcode 231 - Power of 2
date: 2021-11-05 03:12:09
tags:
- math
---
**`Note:`**
- Using iteration is weak.
- `LOWBIT`! - To get the `lowest 1` in a number.
- Power of 2 only has one `1`. So `n & -n === n`.

**`Question:`**

Given an integer `n`, return true if it is a power of two. Otherwise, return false.

An integer n is a power of two, if there exists an integer x such that `n == 2x`.

**`Example:`**
```
Input: n = 1
Output: true
Explanation: 20 = 1
```

**`Code:`**

**`Math`**
```javascript
/**
 * @param {number} n
 * @return {boolean}
 */
var isPowerOfTwo = function(n) {
  return n > 0 && (n & -n) === n;
};
```

**`Iteration`**
```javascript
/**
 * @param {number} n
 * @return {boolean}
 */
var isPowerOfTwo = function(n) {
  if (n <= 0) return false;
  while (n !== 1) {
    if (n % 2 !== 0) return false;
    n = n / 2;
  }
  return true;
};
```