---
title: Leetcode 844 - Backspace String Compare
date: 2022-01-10 18:04:56
tags:
---
**`Note:`**
- Use stack[].

**`Question:`**

Given two strings s and t, return true if they are equal when both are typed into empty text editors. `'#'` means a backspace character.

Note that after `backspacing` an empty text, the text will continue `empty`.

**`Example:`**
```
Input: s = "ab#c", t = "ad#c"
Output: true
Explanation: Both s and t become "ac".
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {string} t
 * @return {boolean}
 */
var backspaceCompare = function(s, t) {
  return helper(s) === helper(t);
  
  function helper(str) {
    let stack = [];
    for (const ch of str) {
      if (ch === '#') {
        stack.pop();
        continue;
      }
      stack.push(ch);
    }
    return stack.join('');
  }
};
```