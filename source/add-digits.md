---
title: Leetcode 258 - Add digits
date: 2021-10-26 20:23:30
tags:
---
**`Note:`**
- Use `%` to get the remainder.
- Use `~~` to round numbers.
- Use `/` to do division.

**`Question:`**

Given an integer num, repeatedly add all its digits until the result has only one digit, and return it.

**`Example:`**
```
Input: num = 38
Output: 2
Explanation: The process is
38 --> 3 + 8 --> 11
11 --> 1 + 1 --> 2 
Since 2 has only one digit, return it.
```

**`Code:`**
```javascript
/**
 * @param {number} num
 * @return {number}
 */
var addDigits = function(num) {
  while (~~(num / 10) !== 0) {
    let tmp = 0;
    while (num !== 0) {
      tmp += num % 10;
      num = ~~(num / 10);
    }
    num = tmp;
  }
  return num;
};
```