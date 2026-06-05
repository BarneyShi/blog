---
title: Leetcode 392 - Is subsequence
date: 2021-09-22 21:22:10
tags:
- dp
---
**`Note`**
- DP
  - It's just `find the longest common subsequence`. And if its `length === s.length`, it means `true`!
- Doule pointer


Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

**Example**
```
Input: s = "abc", t = "ahbgdc"
Output: true
```

**`DP`**
```javascript
/**
 * @param {string} s
 * @param {string} t
 * @return {boolean}
 */
var isSubsequence = function(s, t) {
  let dp = [...Array(s.length+1)].map(e => Array(t.length+1).fill(0));
  for (let i = 1; i <= s.length; i++) {
    for (let j = 1; j <= t.length; j++) {
      if (s[i-1] === t[j-1]) {
        dp[i][j] = dp[i-1][j-1] + 1;
      } else {
        dp[i][j] = Math.max(dp[i][j-1], dp[i-1][j]);
      }
    }
  }
  return dp[s.length][t.length] === s.length;
};
```

**`Double Pointers`**
```javascript
/**
 * @param {string} s
 * @param {string} t
 * @return {boolean}
 */
var isSubsequence = function(s, t) {
  if (s.length === 0) return true;
  let i = 0;
  for (let j = 0; j < t.length && i < s.length; j++) {
    if (i === s.length) return true;
    if (s[i] === t[j]) {
      i++;
    }
  }
  return i === s.length;
};
```