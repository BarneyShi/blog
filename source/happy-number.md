---
title: Leetcode 202 - Happy number
date: 2021-08-18 23:08:37
tags:
- math
- hash table
---
**Note**
- Learnt how to manipulate numbers. Like how to get the last digit with modulues operator `num % 10`.
- Learn how to use `hash` to check if nums appeared before.

```javascript
/**
 * @param {number} n
 * @return {boolean}
 */
var isHappy = function(n) {
  let nums = [];
  while (!nums.includes(n)) {
    if (n === 1) return true;
    nums.push(n);
    const sum = addAllDigits(n);
    n = sum;
  }
  return false;
};

function addAllDigits(num) {
  let result = 0;
  while (num > 0) {
    result += (num % 10)**2;
    num = Math.floor(num / 10);
  }
  return result;
}
```

