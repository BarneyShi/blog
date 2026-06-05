---
title: Leetcode 693 - Binary Number with Alternating Bits
date: 2021-12-20 21:18:34
tags:
- bitwise
---
**`Note:`**
- Use `& 1` to get the least significant bit.
- Use `lastBit` to preserve last bit.
- Note that `&` has a lower priority than `===`.

**`Question:`**

Given a positive integer, check whether it has alternating bits: namely, if two adjacent bits will always have different values.

**`Example:`**
```
Input: n = 5
Output: true
Explanation: The binary representation of 5 is: 101
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @return {boolean}
 */
 var hasAlternatingBits = function(n) {
  let lastBit = n & 1;
  while (n !== 0) {
    n = n >>> 1;
    // Has to add () to n & 1.
    if ((n & 1) === lastBit) return false;
    lastBit = n & 1;
  }
  return true;
};
```