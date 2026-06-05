---
title: Leetcode 165 - Compare version nums
date: 2021-11-30 00:58:43
tags:
---
**`Note:`**
- Quite easy. Split each into an array of nums then compare one by one.
- Fill `undefined` with `0`s.

**`Question:`**

Given two version numbers,` version1` and `version2`, compare them.

Version numbers consist of `one or more revisions` joined by a dot `'.'`. Each revision consists of digits and may contain leading `zeros`. Every revision contains `at least one character`. Revisions are 0-indexed from left to right, with the leftmost revision being revision 0, the next revision being revision 1, and so on. For example `2.5.33` and `0.1` are valid version numbers.

To compare version numbers, compare their revisions in `left-to-right order`. Revisions are compared using their `integer value ignoring any leading zeros`. This means that revisions 1 and 001 are considered equal. If a version number does not specify a revision at an index, then treat the revision as 0. For example, version 1.0 is less than version 1.1 because their revision 0s are the same, but their revision 1s are 0 and 1 respectively, and `0 < 1`.

Return the following:

- If version1 < version2, return -1.
- If version1 > version2, return 1.
- Otherwise, return 0.

**`Example:`**
```
Input: version1 = "1.01", version2 = "1.001"
Output: 0
Explanation: Ignoring leading zeroes, both "01" and "001" represent the same integer "1".
```

**`Code:`**
```javascript
/**
 * @param {string} version1
 * @param {string} version2
 * @return {number}
 */
var compareVersion = function(version1, version2) {
  version1 = version1.split('.').map(e => e - 0);
  version2 = version2.split('.').map(e => e - 0);
  for (let i = 0; i < version1.length || i < version2.length; i++) {
    if (version1[i] === undefined) version1[i] = 0;
    if (version2[i] === undefined) version2[i] = 0;
    if (version1[i] < version2[i]) {
      return -1;
    } else if (version1[i] > version2[i]) {
      return 1;
    }
  }
  return 0;
};
```