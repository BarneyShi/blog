---
title: Leetcode 367 - Valid perfect square
date: 2021-11-03 18:40:52
tags:
---
**`Note:`**
- Use `division` instead of `multiplication`.

**`Question:`**

Given a `positive` integer num, write a function which returns True if num is a perfect square else False.

Follow up: `Do not` use any built-in library function such as sqrt.

**`Example:`**
```
Input: num = 16
Output: true
```

**`Code:`**
```javascript
/**
 * @param {number} num
 * @return {boolean}
 */
var isPerfectSquare = function(num) {
  let left = 1, right = num;
  while (left <= right) {
    let middle = ~~(left + (right - left) / 2);
    // Don't use multiplication, otherwise there might be OVERFLOW.
    if (num % middle === 0 && num / middle === middle) return true;
    if (num / middle < middle) {
      right = middle - 1;
    } else {
      left = middle + 1;
    }
  }
  return false;
};
```