---
title: Leetcode 522 - Longest Uncommon Subsequence II
date: 2021-11-29 20:29:39
tags:
---
**`Note:`**
- Sorting
  - If the subsequence exists, it must be one of the element.
    - Why? Coz it must be derived from one of the elements. The element must also be the sequence.
  - How to check if one string is another one's sub?
    - Assume `a.len < b.len`. Iterate through the longers one, if `b[i] === a[j]`, then `j++`, check if `j === a.len`. BTW, if `a.len > b.len` return false coz a longer one won't be a shorter one's subs. (Subs can only be derived by deleting chars, not adding.)
  - Use double for loops to find it.

- Hash table
  - Get all subsequences together.
  - Use a `map` to count.
  - The `longest` subs that only `appear once` is the answer.

**`Question:`**

Given an array of strings `strs`, return the length of the `longest uncommon subsequence` between them. If the longest uncommon subsequence does not exist, return `-1`.

An `uncommon subsequence` between an array of strings is a string that is a `subsequence of one string but not the others`.

A `subsequence` of a string `s` is a string that can be obtained after deleting any number of characters from s.

- For example, "abc" is a subsequence of "aebdc" because you can delete the underlined characters in "aebdc" to get "abc". Other subsequences of "aebdc" include "aebdc", "aeb", and "" (empty string).

**`Example:`**
```
Input: strs = ["aba","cdc","eae"]
Output: 3
```

**`Code:`**

**`Sort then compare O(x * n^2)`**
```javascript
/**
 * @param {string[]} strs
 * @return {number}
 */
 var findLUSlength = function(strs) {
  strs.sort((a, b) => b.length - a.length);
  for (let i = 0; i < strs.length; i++) {
    let flag = true;
    for (let j = 0; j < strs.length; j++) {
      if (i === j) continue;
      if (isSub(strs[i], strs[j])) {
        flag = false;
        break;
      }
    }
    if (flag) return strs[i].length;
  }
  return -1;

  function isSub(a, b) {
    if (a.length > b.length) return false;
    let j = 0;
    for (let i = 0; i < b.length && j < a.length; i++) {
      if (b[i] === a[j]) j++;
    }
    return j === a.length;
  }
};
```

**`Get all subs of a string O(n * 2^x)`**
```javascript
/**
 * @param {string[]} strs
 * @return {number}
 */
 var findLUSlength = function(strs) {
  let map = new Map();
  for (const s of strs) {
    const res = getSubsequences(s);
    res.forEach(e => {
      if (!map.has(e)) {
        map.set(e, 1);
      } else {
        map.set(e, map.get(e) + 1);
      }
    })
  }
  let res = -1;
  for (const [key, val] of map) {
    if (val === 1) res = Math.max(res, key.length);
  }
  return res;
  
  function getSubsequences(s) {
    let res = new Set();
    let path = [];
    dfs(0, s);
    return Array.from(res);

    function dfs(startIndex, s) {
      if (startIndex === s.length) {
        res.add(path.join(''));
        return;
      }
      path.length > 0 && res.add(path.join(''));
      for (let i = startIndex; i < s.length; i++) {
        path.push(s[i]);
        dfs(i + 1, s);
        path.pop();
      }
    }
  }
};
```