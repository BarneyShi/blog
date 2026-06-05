---
title: Leetcode 709 - To Lower Case
date: 2021-12-11 15:21:09
tags:
---
**`Note:`**


**`Question:`**

Given a string `s`, return the string after replacing every uppercase letter with the same lowercase letter.

**`Example:`**
```
Input: s = "Hello"
Output: "hello"
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {string}
 */
var toLowerCase = function(s) {
  s = s.split('');
  for (let i = 0; i < s.length; i++) {
    if (s[i].charCodeAt(0) <= 'Z'.charCodeAt(0)) {
      s[i] = s[i].toLowerCase();
    }
  }
  return s.join('');
};
```