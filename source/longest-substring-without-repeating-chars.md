---
title: Leetcode 3 - Longest substring without repeating chars
date: 2021-10-19 19:21:30
tags:
- string
- double pointers
---
**`Note:`**
- Use `doule pointer`.
- While next char is not in cur substring, move `right` by 1.
- When next char is included, move `left` to `j + 1` where `j` is the repeating char inside substring. 

**`Question:`**

Given a string `s`, find the length of the longest substring without repeating characters.

**`Example:`**
```
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {number}
 */
var lengthOfLongestSubstring = function (s) {
  if (s.length <= 1) return s.length;
  let left = 0, right = 0;
  let result = 0;
  while (right < s.length - 1) {
    const str = s.slice(left, right + 1);
    if (!str.includes(s[right + 1])) {
      right++;
    } else {
      // Not s.indxOf but str and we need to add `left` to it.
      const index = str.indexOf(s[right + 1]) + left;
      left = index + 1;
      right++;
    }
    result = Math.max(right - left + 1, result);
  }
  return result;
};
```