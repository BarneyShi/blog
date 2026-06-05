---
title: Leetcode 504 - Base 7
date: 2021-11-23 21:02:09
tags:
---
**`Note:`**
- Just like how to convert decimal to binary numbers. 
- Divide `num` by `7` every time, and append `remainder` to the front till `num` becomes `0`.

**`Question:`**

Given an integer `num`, return a string of its `base 7` representation.

**`Example:`**
```
Input: num = 100
Output: "202"
```

**`Code:`**
```javascript
/**
 * @param {number} num
 * @return {string}
 */
var convertToBase7 = function(num) {
  if (num === 0) return '0';
  let res = '';
  let isNegative = false;
  if (num < 0) {
    num = -num;
    isNegative = true;
  }
  while (num !== 0) {
    res = (num % 7) + res;
    num = ~~(num / 7);
  }
  return (isNegative ? '-' : '') + res;
};
```