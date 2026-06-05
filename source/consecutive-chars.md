---
title: Leetcode 1446 - Consecutive chars
date: 2021-11-30 15:14:02
tags:
---
**`Note:`**
- Classic simulation problem.

**`Question:`**

The `power` of the string is the maximum length of a non-empty substring that contains only one unique character.

Given a string `s`, return the power of `s`.

**`Example:`**
```
Input: s = "leetcode"
Output: 2
Explanation: The substring "ee" is of length 2 with the character 'e' only.
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {number}
 */
var maxPower = function(s) {
  let res = 1;
  let length = 1;
  for (let i = 0; i < s.length; i++) {
    if (i > 0 && s[i - 1] === s[i]) {
      length++;
      res = Math.max(length, res);
    } else {
      length = 1;
    }
  }
  return res;
};
```