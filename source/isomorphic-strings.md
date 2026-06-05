---
title: Leetcode 205 - Isomorphic strings
date: 2021-11-04 03:20:34
tags:
- string
---
**`Note:`**
- Convert both strings into patterns like `ABB`.
- Compare if their patterns are the same.

**`Question:`**

Given two strings `s` and `t`, determine if they are isomorphic.

Two strings s and t are isomorphic if the characters in s can be replaced to get t.

All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

**`Example:`**
```
Input: s = "egg", t = "add"
Output: true
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {string} t
 * @return {boolean}
 */
var isIsomorphic = function(s, t) {
  let map1 = new Map();
  let pattern1 = '';
  let map2 = new Map();
  let pattern2 = '';
  for (const char of s) {
    if (!map1.has(char)) {
      const letter = String.fromCharCode(65 + map1.size);
      map1.set(char, letter);
      pattern1 += letter;
    } else {
      pattern1 += map1.get(char);
    }
  }
  for (const char of t) {
    if (!map2.has(char)) {
      const letter = String.fromCharCode(65 + map2.size);
      map2.set(char, letter);
      pattern2 += letter;
    } else {
      pattern2 += map2.get(char);
    }
  }
  return pattern1 === pattern2;
};
```