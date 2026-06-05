---
title: Leetcode 227 - Basic calculator II
date: 2021-10-17 18:03:40
tags:
---
**`Note:`**
- Need a `regex` to remove spaces from the expression.
- Need a `prev` to store last operand.
- For division and multiplication, we need to update `prev` as `prev*cur` or `prev/cur`. 

**`Question:`**

Given a string s which represents an expression, evaluate this expression and return its value. 

The integer division should truncate toward zero.

You may assume that the given expression is always valid. All intermediate results will be in the range of [-231, 231 - 1].

Note: You are `not allowed` to use any built-in function which evaluates strings as mathematical expressions, such as eval().

**`Example:`**
```
Input: s = " 3+5 / 2 "
Output: 5
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {number}
 */
var calculate = function (s) {
  // Pre-process to remove spaces.
  const regex = / */g
  s = s.replace(regex, '');
  s = '+' + s;

  let result = 0;
  let prev = result;

  let i = 0;
  while (i < s.length) {
    const operator = s[i];
    i++;
    let operand = '';
    while (!isNaN(s[i])) {
      operand += s[i];
      i++;
    }
    operand -= 0;
    if (operator === '+') {
      result += operand;
      prev = operand;
    } else if (operator === '-') {
      result -= operand;
      prev = -operand;
    } else if (operator === '*') {
      result = (result - prev) + prev*operand;
      prev = prev*operand;
    } else {
      result = (result - prev) + ~~(prev / operand);
      prev = ~~(prev / operand);
    }
  }
  return result;
};
```