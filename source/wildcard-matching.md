---
title: Leetcode 44 - Wildcard matching
date: 2021-11-07 01:14:07
tags:
- dfs
---
**`Note:`**
- Just like leetcode 10, use dfs with memo.
- There are several tricky test cases that you need to take care of 
  - `('', '*******')`
  - `('', '?')`. ? cannot represent an emtpty char.
- If `p[j] == '*'`
  - If `i >= sLen`, `*` can be ignored, so let's jump cur p[j], and do `dfs(i, j + 1)`.
  - If `i < sLen`, there are three options:
    - Let * represent more than one char, Jump to next char of s - `dfs(i + 1, j)`
    - Ignore cur char of p - `dfs(i, j + 1)`.
    - Accept * only once, `dfs(i + 1, j + 1)`
- If `p[i] != '*'`
  - Do a match check if `s[i] === p[j]` or `(p[j] === '?' && s[i] !== "" && s[i] !== undefined)`. - For cases like `'', '?'`.
  - Check `(i + 1, j + 1)`.

**`Question:`**

Given an input string (`s`) and a pattern (`p`), implement wildcard pattern matching with support for `'?'` and `'*'` where:

- `'?'` Matches any single character.
- `'*'` Matches any sequence of characters (including the empty sequence).
The matching should cover the entire input string (not partial).

**`Example:`**
```
Input: s = "adceb", p = "*a*b"
Output: true
Explanation: The first '*' matches the empty sequence, while the second '*' matches the substring "dce".
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {string} p
 * @return {boolean}
 */
var isMatch = function (s, p) {
  let memo = {};
  const sLen = s.length;
  const pLen = p.length;
  return dfs(0, 0);

  function dfs(i, j) {
    if (memo[i + ':' + j] !== undefined) return memo[i + ':' + j];
    if (i >= sLen && j >= pLen) return true;
    // Do not write if (i >= sLen || j >= pLen) return false, it will fail ('', '****') this case.

    let tmp = false;
    const match = s[i] === p[j] || (p[j] === '?' && s[i] !== "" && s[i] !== undefined);
    if (p[j] === '*') {
      if (i >= sLen) {
        tmp = dfs(i, j + 1);
      } else {
        tmp = dfs(i + 1, j) || dfs(i, j + 1) || dfs(i + 1, j + 1);
      }
    } else {
      tmp = match && dfs(i + 1, j + 1);
    }
    memo[i + ':' + j] = tmp;
    return tmp;
  }
};
```