---
title: Leetcode 242 - Valid anagram
date: 2021-10-14 16:24:40
tags:
- hash table
---
**`Note:`**
- `Anagram` is a different word using another word's letters with the same amounts.

**`Question:`**

Given two strings s and t, return true if t is an anagram of s, and false otherwise.

**`Example:`**
```
Input: s = "anagram", t = "nagaram"
Output: true
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {string} t
 * @return {boolean}
 */
var isAnagram = function(s, t) {
  const map = new Map();
  for (let i = 0; i < t.length; i++) {
    if (!map.has(t[i])) {
      map.set(t[i], 1);
    } else {
      map.set(t[i], map.get(t[i]) + 1);
    }
  }
  for (let j = 0; j < s.length; j++) {
    if (!map.has(s[j])) return false;
    map.set(s[j], map.get(s[j]) - 1);
    if (map.get(s[j]) === 0) map.delete(s[j]);
  }
  return map.size === 0;
};
```