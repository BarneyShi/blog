---
title: Leetcode 201 - Bitwise AND of Numbers Range
date: 2021-11-30 20:14:06
tags:
- bitwise
---
**`Note:`**
- Can't do AND one by one, it will cause TLE.
- Find the `biggest` 2's power of `right` as `pow`.
- We can be sure that `pow` highest bit is the same as `right`. 
- Number bigger than pow & pow === pow.
- Number samller than pow & pow === `0`. Except when `left == 1, right === 1`.

**`Question:`**

Given two integers `left` and `right` that represent the range `[left, right]`, return the bitwise AND of all numbers in this range, inclusive.

**`Example:`**
```
Input: left = 5, right = 7
Output: 4
```

**`Code:`**
```javascript
/**
 * @param {number} left
 * @param {number} right
 * @return {number}
 */
 var rangeBitwiseAnd = function(left, right) {
  if (left === 0) return 0;
  const perfectSqRight = findTheLargestPower2(right);
  if (perfectSqRight >= left) return perfectSqRight & left;
  let res = left;
  for (let i = left + 1; i <= right; i++) {
    res = res & i;
  }
  return res;

  function findTheLargestPower2(n) {
    if ((n & -n) === n) return n;
    for (let i = 30; i >= 0; i--) {
      if (n >>> i === 1) return 1 << i;
    }
  }
};
```