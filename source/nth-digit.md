---
title: Leetcode 400 - Nth digit
date: 2021-11-29 17:42:08
tags:
- math
---
**`Note:`**
- ![img](https://i.imgur.com/5a5v0zg.png)
- Based on this partterns, use a while loop to find the `length` of target number. Keep subtracting from `n`.
- After the while loop, use `offset = Math.ceil(n / digits) - 1` to find what the `target number` is.
  - For example, the input was `11`, and now `n === 2`. So the target number is 10.
- How to find the index?
  - If `n % digits === 0`, it's the last digit.
  - If not, it's `n % digits - 1`.
- Convert the number string and return `num[index]`.

**`Question:`**

Given an integer n, return the nth digit of the infinite integer sequence [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ...].

**`Example:`**
```
Input: n = 11
Output: 0
Explanation: The 11th digit of the sequence 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ... is a 0, which is part of the number 10.
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @return {number}
 */
 var findNthDigit = function (n) {
  let digits = 1;
  while (n - 9 * (Math.pow(10, digits - 1)) * digits > 0) {
    n -= 9 * (Math.pow(10, digits - 1)) * digits;
    digits++;
  }
  const offset = Math.ceil(n / digits) - 1;
  const index =  n % digits === 0 ? digits - n % digits - 1 : n % digits - 1;
  const theNumber = Math.pow(10, digits - 1) + offset + '';
  return theNumber[index];
};
```