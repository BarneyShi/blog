---
title: Leetcode 405 - Convert a number into Hex
date: 2021-11-12 00:33:01
tags:
- bitwise
---
**`Note:`**
- `Negative` and `positive` numbers are all store as `binary`, so we don't really need to worry about it.
- Use `bitmask 0xf` to get the last 4 bits.
- Use a string '0123456789abcdef' and a num's `Mod with 16` to get the char we want. (That's smart!)

**`Question:`**

Given an integer `num`, return a string representing its hexadecimal representation. For negative integers, `two’s complement` method is used.

All the letters in the answer string should be lowercase characters, and there should not be any leading zeros in the answer except for the zero itself.

`Note`: You are not allowed to use any built-in library method to directly solve this problem.

**`Example:`**
```
Input: num = -1
Output: "ffffffff"
```

**`Code:`**
```javascript
/**
 * @param {number} num
 * @return {string}
 */
var toHex = function(num) {
  if (num === 0) return '0';
  let ans = '';
  const nums = '0123456789abcdef';
  while (num !== 0) {
    const last4 = num & 0xf;
    ans = nums[last4 % 16] + ans;
    num = num >>> 4;
  }
  return ans;
};
```