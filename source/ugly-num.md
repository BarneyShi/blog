---
title: Leetcode 263 - Ugly number
date: 2021-11-07 02:33:38
tags:
---
**`Note:`**
- Use recursion
- `1` is a special number.
- If a number is not divisible to `2, 3, 5`, then it's not.

**`Question:`**

An `ugly number` is a positive integer whose prime factors are limited to `2`, `3`, and `5`.

Given an integer n, return `true` if n is an ugly number.

**`Example:`**
```
Input: n = 6
Output: true
Explanation: 6 = 2 × 3

Input: n = 1
Output: true
Explanation: 1 has no prime factors, therefore all of its prime factors are limited to 2, 3, and 5.
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @return {boolean}
 */
var isUgly = function (n) {
  if (n <= 0) return false;
  if (n === 1) return true;
  const factors = [2, 3, 5];
  return dfs(n);

  function dfs(num) {
    if (factors.includes(num)) return true;
    return (num % 2 === 0 && dfs(num / 2)) || (num % 3 === 0 && dfs(num / 3)) || (num % 5 === 0 && dfs(num / 5));
  }
};
```