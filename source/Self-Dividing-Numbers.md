---
title: Leetcode 728 - Self Dividing Numbers
date: 2021-12-25 02:24:50
tags:
- bitwise
---
**`Note:`**
- Classic uses of % and / to get the least significant digit and shorten the num by 1 digit.

**`Question:`**

A self-dividing number is a number that is divisible by every digit it contains.

- For example, 128 is a self-dividing number because 128 % 1 == 0, 128 % 2 == 0, and 128 % 8 == 0.

A `self-dividing number` is not allowed to contain the digit `zero`.

Given two integers `left` and `right`, return a list of all the self-dividing numbers in the range [left, right].

**`Example:`**
```
Input: left = 1, right = 22
Output: [1,2,3,4,5,6,7,8,9,11,12,15,22]
```

**`Code:`**
```javascript
/**
 * @param {number} left
 * @param {number} right
 * @return {number[]}
 */
var selfDividingNumbers = function(left, right) {
  let ans = [];
  for (let i = left; i <= right; i++) {
    if (isDivisible(i)) ans.push(i);
  }
  return ans;

  function isDivisible(num) {
    let dividend = num;
    while (num !== 0) {
      const divisor = num % 10;
      if (divisor === 0 || dividend % divisor !== 0) return false;
      num = Math.floor(num / 10);
    }
    return true;
  }
};
```