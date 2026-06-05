---
title: Leetcode 680 - Valid Palindrome II
date: 2021-12-18 00:39:55
tags:
- dfs
- double pointers
---
**`Note:`**
- DFS all the way. Use `times` as a param to record times we deleted chars.
- Pair with double pointers.
- If `left >= right` return true.
- If `s[l] === s[r]` then continue dfs.
- If not,
  - times >= 1 return false.
  - Otherwise continue dfs with `times + 1`.

**`Question:`**

Given a string `s`, return `true` if the `s` can be palindrome after deleting `at most one` character from it.

**`Example:`**
```
Input: s = "abca"
Output: true
Explanation: You could delete the character 'c'.
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {boolean}
 */
var validPalindrome = function(s) {
  let left = 0, right = s.length - 1;
  return dfs(left, right, 0);

  function dfs(left, right, times) {
    if (left >= right) return true;
    if (s[left] === s[right]) {
      return dfs(left + 1, right - 1, times);
    } else {
      if (times >= 1) return false;
      return dfs(left + 1, right, times + 1) || dfs(left, right - 1, times + 1);
    }
  }
};
```