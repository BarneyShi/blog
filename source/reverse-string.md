---
title: Leetcode 344 - Reverse string
date: 2021-09-22 01:09:14
tags:
- string
- double pointers
---
**`Note`**
- `Double pointers` is the way to go.

Write a function that reverses a string. The input string is given as an array of characters s.

**Example 1:**
```
Input: s = ["h","e","l","l","o"]
Output: ["o","l","l","e","h"]
```

```javascript
/**
 * @param {character[]} s
 * @return {void} Do not return anything, modify s in-place instead.
 */
var reverseString = function(s) {
  let left = 0, right = s.length - 1;
  while (left < right) {
    [s[left], s[right]] = [s[right], s[left]];
    left++;
    right--;
  }
  return s;
};
```
