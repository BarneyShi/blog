---
title: Leetcode 482 - License key formatting
date: 2021-11-21 16:24:04
tags:
- string
---
**`Note:`**
- Iterate backwards
- Use a `count` to store how many word we've got for a segmant. 
- Reset `count` when it hits `k` and add `-` to the front.
- Special case is when there is a `dash` left on the front.

**`Question:`**

You are given a license key represented as a string `s` that consists of only alphanumeric characters and dashes. The string is separated into `n + 1` groups by `n` dashes. You are also given an integer `k`.

We want to reformat the string `s` such that each group contains exactly `k` characters, except for the first group, which could be shorter than k but still must contain at least one character. Furthermore, there must be a dash inserted between two groups, and you should convert all lowercase letters to uppercase.

Return the reformatted license key.

**`Example:`**
```
Input: s = "5F3Z-2e-9-w", k = 4
Output: "5F3Z-2E9W"
Explanation: The string s has been split into two parts, each part has 4 characters.
Note that the two extra dashes are not needed and can be removed.
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {number} k
 * @return {string}
 */
var licenseKeyFormatting = function(s, k) {
  let res = '';
  let count = 0;
  for (let i = s.length - 1; i >= 0;  i--) {
    if (s[i] !== '-') {
      res = (isNaN(s[i]) ? s[i].toUpperCase() : s[i]) + res;
      count++;
      if (count === k && i !== 0) {
        res = '-' + res;
        count = 0;
      }
    }
  }
  if (res[0] === '-') return res.slice(1);
  return res;
};
```