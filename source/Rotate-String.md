---
title: Leetcode 796 - Rotate String
date: 2021-12-29 03:09:07
tags:
---
**`Note:`**
- Straightforward simulation

**`Question:`**

Given two strings `s` and `goal`, return true if and only if s can become `goal` after some number of shifts on s.

A `shift` on `s` consists of moving the leftmost character of s to the rightmost position.

- For example, if s = "abcde", then it will be "bcdea" after one shift.

**`Example:`**
```
Input: s = "abcde", goal = "cdeab"
Output: true
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {string} goal
 * @return {boolean}
 */
var rotateString = function(s, goal) {
  if (s.length !== goal.length) return false;
  for (let i = 0; i < s.length; i++) {
    if (s.slice(i + 1) + s.slice(0, i + 1) === goal) return true;
  }
  return false;
};
```