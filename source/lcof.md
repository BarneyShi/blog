---
title: Leetcode Offer 58 - Rotate string leftly
date: 2021-10-12 22:48:34
tags:
- string
---
**`Note:`**
- Normal approach is easy to come up with, but try to using `O(1)` extra space.
- Original length is `length = s.length`
- Along with concatenating the last char to `s`, we find that we are always using `newS[oriLength - 1]`.

**`Question:`**

Reverse string from index `k` to the left.

**`Example:`**
```
Input: s = "abcdefg", k = 2
Output: "cdefgab
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {number} n
 * @return {string}
 */
var reverseLeftWords = function(s, n) {
  const length = s.length;
  let i = 0;
  while (i < length - n) {
    s = s[length - 1] + s;
    i++;
  }
  return s.slice(0, length);
};
```