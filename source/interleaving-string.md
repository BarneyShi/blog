---
title: Leetcode 97 - Interleaving string
date: 2021-11-26 23:41:10
tags:
- dfs
---
**`Note:`**
- Use three pointers with recursion.
- `p1, p2, p3` represents the index of each string.
- Use `memorization` coz it's possible that there are repetitive calculations.

**`Question:`**

Given strings `s1`, `s2`, and `s3`, find whether `s3` is formed by an interleaving of `s1` and `s2`.

An `interleaving` of two strings `s` and `t` is a configuration where they are divided into non-empty substrings such that:

- `s = s1 + s2 + ... + sn`
- `t = t1 + t2 + ... + tm`
- `|n - m| <= 1`
- The interleaving is `s1 + t1 + s2 + t2 + s3 + t3 + ...` or `t1 + s1 + t2 + s2 + t3 + s3 + ...`

Note: a + b is the concatenation of strings a and b.

**`Example:`**
![img](https://assets.leetcode.com/uploads/2020/09/02/interleave.jpg)
```
Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
Output: true
```

**`Code:`**
```javascript
/**
 * @param {string} s1
 * @param {string} s2
 * @param {string} s3
 * @return {boolean}
 */
var isInterleave = function(s1, s2, s3) {
  let memo = {};
  if (s1.length + s2.length !== s3.length) return false;
  return dfs(0, 0, 0);

  function dfs(p1, p2, p3) {
    if (memo[p1 + '.' + p2 + '.' + p3] !== undefined) return memo[p1 + '.' + p2 + '.' + p3];
    if (p1 > s1.length || p2 > s2.length) return false;
    if (p3 === s3.length && p1 === s1.length && p2 === s2.length) return true;
    let bool = false;
    if (s1[p1] === s3[p3] && s2[p2] === s3[p3]) {
      bool = dfs(p1 + 1, p2, p3 + 1) || dfs(p1, p2 + 1, p3 + 1);
    } else if (s1[p1] === s3[p3]) {
      bool = dfs(p1 + 1, p2, p3 + 1);
    } else if (s2[p2] === s3[p3]) {
      bool = dfs(p1, p2 + 1, p3 + 1);
    }
    memo[p1 + '.' + p2 + '.' + p3] = bool;
    return bool;
  }
};
```