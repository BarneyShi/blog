---
title: Leetcode 10 - Regular expression matching
date: 2021-11-06 03:55:18
tags:
- dfs
---
**`Note:`**
- `DFS witn memo`
  - `DP` is too hard so I guess I'll use DFS instead.
  - Base case: when either `i` or `j` is bigger than their length, it means we've searched all chars in both strs, return `true`.
  - Because of the specialty of `*`, we have an `if-else` statement based on whether the next char is `*` or not.
    - If it is, there are two situations: `Use it` at least once or `ignore` its preceding char.
      - Note: if we are gonna use it, the premise is that `(s[i] === p[j] || p[j] === '.')`.
    - If it is not, we just need to check if `(s[i] === p[j] || p[j] === '.')`.
  - Some tricky parts:
    - DON'T use array as map's key, it doesn't work because `comma operator` only return the `last operand`.
    - https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Comma_Operator
    - Always put `match before recursions` because otherwise we'll fall into a loop hole. Match has the function to terminate the call.

**`Question:`**

Given an input string `s` and a pattern `p`, implement regular expression matching with support for '.' and '*' where:

- '.' Matches any single character.​​​​
- '*' Matches zero or more of the preceding element.
- The matching should cover the `entire` input string (not partial).

**`Example:`**
```
Input: s = "aab", p = "c*a*b"
Output: true
Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab".
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {string} p
 * @return {boolean}
 */
var isMatch = function (s, p) {
  const sLen = s.length;
  const pLen = p.length;
  let map = {};
  return dfs(0, 0);

  function dfs(i, j) {
    if (map[i + ':' + j] != undefined) return map[(i, j)];
    if (j >= pLen && i >= sLen) return true;

    const match = (i < sLen) && (s[i] === p[j] || p[j] === '.');
    let tmp = false;

    if (j + 1 < pLen && p[j + 1] === '*') {
      tmp = (match && dfs(i + 1, j)) || dfs(i, j + 2);
    } else {
      tmp = match && dfs(i + 1, j + 1);
    }
    map[i + ':' + j] = tmp;
    return tmp;
  }
};
```