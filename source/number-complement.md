---
title: Leetcode 476 - Number complement
date: 2021-11-19 20:55:31
tags:
- bitwise
---
**`Note:`**
- Use `& 1` to get the last digit while constantly using `>>> 1` to right shift `num` till it's `0`.
- Set a `res`, then do `|` to add up with `1 << i`.

**`Question:`**

The `complement` of an integer is the integer you get when you flip all the `0`'s to `1`'s and all the `1`'s to `0`'s in its binary representation.

- For example, The integer `5` is "`101`" in binary and its complement is "`010`" which is the integer `2`.

Given an integer `num`, return its complement.

**`Example:`**
```
Input: num = 5
Output: 2
Explanation: The binary representation of 5 is 101 (no leading zero bits), and its complement is 010. So you need to output 2.
```

**`Code:`**
```javascript
/**
 * @param {number} num
 * @return {number}
 */
var findComplement = function(num) {
  let i = 0;
  let res = 0;
  while (num !== 0) {
    const last = num & 1;
    if (last === 0) {
      res |= 1 << i;
    }
    i++;
    num = num >>> 1;
  }
  return res;
};
```