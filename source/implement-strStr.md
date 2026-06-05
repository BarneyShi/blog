---
title: Leetcode 28 - Implement strStr()
date: 2021-10-13 00:07:20
tags:
---
**`Note:`**
- `Naive` method: Start checking once `haystack[i] === needle[0]`.
- `KMP` continue

**`Question:`**

Implement strStr().

Return the `index` of the `first occurrence` of needle in haystack, or -1 if needle is not part of haystack.

Clarification:

What should we return when needle is an empty string? This is a great question to ask during an interview.

For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

**`Example:`**
```
Input: haystack = "hello", needle = "ll"
Output: 2
```

**`Code:`**
```javascript
/**
 * @param {string} haystack
 * @param {string} needle
 * @return {number}
 */
var strStr = function(haystack, needle) {
  if (needle.length === 0) return 0;
  for (let i = 0; i < haystack.length; i++) {
    if (haystack[i] === needle[0]) {
      let j = i;
      let k = 0;
      while(j < haystack.length && k < needle.length) {
        if (haystack[j] !== needle[k]) break;
        j++;
        k++;
      }
      if (k === needle.length) return i;
    }
  }
  return -1; 
};
```