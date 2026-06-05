---
title: Leetcode 290 - Word pattern
date: 2021-11-08 02:24:39
tags:
- hash table
---
**`Note:`**
- Because it's `bijection`, we have to use two `map`s.
- One map is not enough for cases like `'abba', 'dog dog dog dog'` 

**`Question:`**

Given a `pattern` and a string `s`, find if s follows the same pattern.

Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s.

**`Example:`**
```
Input: pattern = "abba", s = "dog cat cat dog"
Output: true
```

**`Code:`**
```javascript
/**
 * @param {string} pattern
 * @param {string} s
 * @return {boolean}
 */
var wordPattern = function(pattern, s) {
  s = s.split(' ');
  if (s.length !== pattern.length) return false;
  let pMap = new Map();
  let sMap = new Map();
  for (let i = 0; i < s.length; i++) {
    if (pMap.has(pattern[i]) && pMap.get(pattern[i]) !== s[i] || sMap.has(s[i]) && sMap.get(s[i]) !== pattern[i]) return false;
    pMap.set(pattern[i], s[i]);
    sMap.set(s[i], pattern[i]); 
  }
  return true;
};
```