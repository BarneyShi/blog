---
title: Leetcode 738 - Monotone increasing digits
date: 2021-10-07 22:58:19
tags:
- greedy
---
**`Note:`**
- By our brute force solution, if we try several nums, it's easy to find that if `nums[i-1] < nums[i]`, we only need to make digits after `i` become `9`, then subtract `1` from `nums[i-1]` (If there is no same digits proceeding it).
- For example, `7886213` -> `7799999`, we need to make the first `8` as `7`, not the second.

**`Question`**
An integer has `monotone increasing digits` if and only if each pair of adjacent digits `x` and `y` satisfy `x <= y`.

Given an integer n, return the largest number that is less than or equal to n with `monotone increasing digits`.

**Example**
```
Input: n = 332
Output: 299
```

**`Code:`**

**`Brute force`**
```javascript
/**
 * @param {number} n
 * @return {number}
 */
var monotoneIncreasingDigits = function(n) {
  while (!isIncreasing(n)) {
    n--;
  }
  return n;
};

function isIncreasing(num) {
  while (num > 0) {
    let lastDigit = num % 10;
    let rest = Math.floor(num / 10);
    if (rest === 0) return true;
    if (lastDigit < rest % 10) return false;
    num = rest;
  }
  return true;
}
```

**`Greedy`**
```javascript
/**
 * @param {number} n
 * @return {number}
 */
var monotoneIncreasingDigits = function(n) {
  let string = n.toString();
  if (string.length === 1) return n;
  for (let i = 1; i < string.length; i++) {
    if (string[i] < string[i - 1]) {
      let j = i - 1;
      while (j >= 0) {
        if (string[j] !== string[j-1]) {
          break;
        }
        j--;
      }
      const res_str = string.slice(0, j) + string[j] - 1 + "9".repeat(string.length - j - 1);
      return res_str;
    }
  }
  return n;
}
```