---
title: Leetcode 521 - Longest uncommon subsequence I
date: 2021-11-29 18:44:25
tags:
- string
---
**`Note:`**
- Mehhh
- If `a !== b`, the longer one must be the other one's `LUS`.

**`Question:`**

Given two strings `a` and `b`, return the `length` of the `longest uncommon subsequence` between a and b. If the longest uncommon subsequence does not exist, return `-1`.

An uncommon subsequence between two strings is a string that is a `subsequence of one but not the other`.

A `subsequence` of a string s is a string that can be obtained after deleting any number of characters from s.

- For example, "abc" is a subsequence of "aebdc" because you can delete the underlined characters in "aebdc" to get "abc". Other subsequences of "aebdc" include "aebdc", "aeb", and "" (empty string).

**`Example:`**
```
Input: a = "aba", b = "cdc"
Output: 3
Explanation: One longest uncommon subsequence is "aba" because "aba" is a subsequence of "aba" but not "cdc".
Note that "cdc" is also a longest uncommon subsequence.
```

**`Code:`**
```javascript
/**
 * @param {string} a
 * @param {string} b
 * @return {number}
 */
var findLUSlength = function(a, b) {
  if (a === b) return -1;
  return Math.max(a.length, b.length);
};
```