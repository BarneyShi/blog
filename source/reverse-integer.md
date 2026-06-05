---
title: Leetcode 7 - Reverse integer
date: 2022-05-12 23:24:22
tags:
- math
---
**`Note:`**
- Note that in JS we don't have `long` so it's be easier.
- In JS, `floor` op would be different for postitive and negative numbers. Use `~~` instead.

**`Question:`**
Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

**`Example:`**
```
Input: x = -123
Output: -321
```

**`Code:`**
```javascript
/**
 * @param {number} x
 * @return {number}
 */
var reverse = function(x) {
  const MAX = 2**31-1;
  const MIN = -1*2**31;
  let ans = 0;
  while (x !== 0) {
    ans = ans * 10 + (x % 10);
    x = ~~(x/10);
  }
  if (ans < MIN || ans > MAX) return 0;
  return ans;
};
```