---
title: Leetcode 415 - Add strings
date: 2021-10-28 17:03:48
tags:
- string
---
**`Note:`**
- Very similar to `addBits`, we need to use two pointers.
- Use `prev` to carry `1` or `0` from prev calculations.

**`Question:`**

Given two non-negative integers, `num1` and `num2` represented as string, return the sum of `num1` and `num2` as a string.

You must solve the problem without using any built-in library for handling large integers (such as `BigInteger`). You must also not convert the inputs to integers directly.

**`Example:`**
```
Input: num1 = "11", num2 = "123"
Output: "134"
```

**`Code:`**
```javascript
/**
 * @param {string} num1
 * @param {string} num2
 * @return {string}
 */
 var addStrings = function(num1, num2) {
  if (num1.length < num2.length) [num1, num2] = [num2, num1];
  num1 = num1.split('').map(e => e - 0);
  num2 = num2.split('').map(e => e - 0);
  let prev = 0;
  for (let i = num1.length - 1; i >= 0; i--) {
    const j = i - (num1.length - num2.length); 
    if (j >= 0) {
      const n1 = num1[i];
      const n2 = num2[j];
      const sum = n1 + n2 + prev;
      if (sum <= 9) {
        prev = 0;
        num1[i] = sum;
      } else {
        prev = 1;
        num1[i] = sum - 10;
      }
    } else {
      const sum = num1[i] + prev;
      if (sum <= 9) {
        prev = 0;
        num1[i] = sum;
      } else {
        prev = 1;
        num1[i] = sum - 10;
      }
    } 
  }
  if (prev !== 0) num1 = [1].concat(num1);
  return num1.join('');
};

```