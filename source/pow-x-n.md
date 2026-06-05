---
title: Leetcode 50 - Pow(x,n)
date: 2021-11-05 17:03:00
tags:
- math
- dfs
---
**`Note:`**
- Using normal iteration by multiplying x every time will cause TLE.
- `2^32 = (2^16)^2 = ((2^8)^2)^2 = (((2^4)^2)^2)^2 = ((((2^2)^2)^2)^2)^2`.
- Instead of multiplying `x`, do `(x^2)^(n/2)` every time.
- It's called `exponentiation by squaring`.
- Leave one `x` out when `n` is odd.

**`Question:`**

Implement `pow(x, n)`, which calculates `x` raised to the power `n` (i.e., xn).

**`Example:`**
```
Input: x = 2.00000, n = 10
Output: 1024.00000
```

**`Code:`**
```javascript
/**
 * @param {number} x
 * @param {number} n
 * @return {number}
 */
var myPow = function(x, n) {
  if (n === 0) return 1;
  if (n < 0) return myPow(1/x, -n);
  if (n & 1 === 1) {
    return x*myPow(x, n-1);
  } else {
    return myPow(x, n/2)**2;
  }
};
```