---
title: Leetcode 459 - Repeated substring pattern
date: 2021-11-16 21:09:34
tags:
- dfs
- kmp
---

**`Note:`**
- `Recursion method`:
  - In a for loop, from `0` to `len - 1`, constantly check if as the current `substr(0, i)`, if we can exhaust the whole string.
- `KMP method`
  - Didn't see that someone would use kmp on an easy question jezz..
  - Generate the `next[]`.
  - If there is a substr such `abcd`, we will have something like `abcd,abcd,...,abcd`.

- `KMP`:
  - If the pattern is like `abcd,abcd,...,abcd`, then `len - next[len - 1] === len(repeatedStr)`.
  - The condition `len % (len - (next[len - 1])) == 0` must be met as well:
    - Explain: `abcd,ef,abcd`. When there are some extra chars in betweem, there is no way that `len` is divisible by `len - (next[len - 1])`.

**`Question:`**

Given a string s, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together.

**`Example:`**

```
Input: s = "abab"
Output: true
Explanation: It is the substring "ab" twice.
```

**`Code:`**

```javascript
/**
 * @param {string} s
 * @return {boolean}
 */
var repeatedSubstringPattern = function (s) {
  for (let i = 0; i < s.length; i++) {
    if (dfs(s, i, s.slice(0, i))) return true;
  }
  return false;

  function dfs(s, i, copy) {
    if (copy === "") return false;
    if (i === s.length) return true;
    if (s.slice(i, i + copy.length) === copy) {
      return dfs(s, i + copy.length, copy);
    }
    return false;
  }
};
```
`O(n)`
```javascript
/**
 * @param {string} s
 * @return {boolean}
 */
var repeatedSubstringPattern = function(s) {
  const next = generateNext(s);
  if (next[s.length - 1] !== 0 && s.length % (s.length - next[s.length - 1]) === 0) return true;
  return false;

  function generateNext(s) {
    let next = [...Array(s.length).fill(0)];
    let i = 0;
    for (let j = 1; j < s.length; j++) {
      while (i > 0 && s[i] !== s[j]) {
        i = next[i - 1];
      }
      if (s[i] === s[j]) {
        i++;
      }
      next[j] = i;
    }
    return next;
  }
};
```
