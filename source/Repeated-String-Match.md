---
title: Leetcode 686 - Repeated String Match
date: 2021-12-21 18:35:37
tags:
- kmp
---
**`Note:`**
- Use `kmp` to check substrings.
- There is a pattern in this problem.
- If `a.len >= b.len`, then we can only repeat a `no more than twice`.
- If `a.len < b.len`, then we can only repeat `ceil(b.len / a.len) + 1` times.
  - For example: `a = 'abc', b = "cabcabca"`. The ans is 4. Because `b` used part of `a` at the start, and part of `a` at the end.

**`Question:`**

Given two strings `a` and `b`, return the minimum number of times you should repeat string `a` so that string `b` is `a` substring of it. If it is impossible for `b​​​​​​` to be `a` substring of `a` after repeating it, return -1.

Notice: string "`abc`" repeated `0` times is "",  repeated `1` time is "abc" and repeated `2` times is "abcabc".

**`Example:`**
```
Input: a = "abcd", b = "cdabcdab"
Output: 3
Explanation: We return 3 because by repeating a three times "abcdabcdabcd", b is a substring of it.
```

**`Code:`**
```javascript
/**
 * @param {string} a
 * @param {string} b
 * @return {number}
 */
 var repeatedStringMatch = function(a, b) {
  if (b.length === 0) return 0;
  if (a.length >= b.length) {
    if (a === b || kmp(a, b)) return 1;
    if (kmp(a.repeat(2), b)) {
      return 2;
    }
  } else if (a.length < b.length) {
    const times = Math.ceil(b.length / a.length);
    if (kmp(a.repeat(times), b)) return times;
    if (kmp(a.repeat(times + 1), b)) return times + 1;
  }
  return -1;

  function kmp(target, pattern) {
    if (pattern.length === 0) return true;
    const next = getNext(pattern);
    let i = 0;
    for (let j = 0; j < target.length; j++) {
      while (i > 0 && target[j] !== pattern[i]) {
        i = next[i - 1];
      }
      if (target[j] === pattern[i]) i++;
      if (i === pattern.length) return true;
    }
    return false;

    function getNext(str) {
      let next = [...new Array(str.length).fill(0)];
      let i = 0;
      for (let j = 1; j < str.length; j++) {
        while (i > 0 && str[i] !== str[j]) {
          i = next[i - 1];
        }
        if (str[i] === str[j]) {
          i++;
        }
        next[j] = i;
      }
      return next;
    }
  }
};
```