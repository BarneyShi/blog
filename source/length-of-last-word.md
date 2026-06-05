---
title: Leetcode 58 - Length of last word
date: 2021-11-03 03:24:11
tags:
---
**`Note:`**
- Just use `trim` to remove leading and trailing spaces.

**`Question:`**

Given a string s consisting of some words separated by some number of spaces, return the length of the last word in the string.

A word is a maximal substring consisting of non-space characters only.

**`Example:`**
```
Input: s = "   fly me   to   the moon  "
Output: 4
Explanation: The last word is "moon" with length 4.
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {number}
 */
var lengthOfLastWord = function(s) {
  s = s.trim();
  let res = 0;
  for (let i = s.length - 1; i >= 0; i--) {
    if (s[i] === ' ') break;
    res++;
  }
  return res;
};
```