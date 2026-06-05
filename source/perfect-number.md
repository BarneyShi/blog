---
title: Leetcode 507 - Perfect number
date: 2021-11-29 00:35:50
tags:
- math
---
**`Note:`**
- Remember to get all divisors, just search between `[sqrt(n), n]`.

**`Question:`**

A `perfect number` is a `positive integer` that is equal to the sum of its positive divisors, excluding the number itself. A divisor of an integer `x` is an integer that can divide `x` evenly.

Given an integer `n`, return `true` if `n` is a perfect number, otherwise return `false`.

**`Example:`**
```
Input: num = 28
Output: true
Explanation: 28 = 1 + 2 + 4 + 7 + 14
1, 2, 4, 7, and 14 are all divisors of 28.
```

**`Code:`**
```javascript
/**
 * @param {number} num
 * @return {boolean}
 */
var checkPerfectNumber = function(num) {
  if (num === 1) return false;
  let sum = 0;
  for (let i = num; i >= Math.ceil(Math.sqrt(num)); i--) {
    if (num % i === 0) sum += (i + num / i);
  }
  return (sum - num) === num;
};
```