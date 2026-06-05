---
title: Leetcode 115 - Distinct subsequences
date: 2021-09-24 00:36:25
tags:
- dp
---
**`Note`**
- `dp[i][j]` means the number of distinct sub between `s[0 - i-1]` that ends with `s[i-1]` and `t[0 - j-1]` that ends with `t[j-1]`.
- When `s[i-1] === t[j-1]`, two situations to consider:
  - consider `s[0 - i-2]` and `t[0 - j-2]`.
  - Don't consider `s[i-1]`, take `s[0 - i-2]` and `t[0 - j-1]` into consideration.
- To initialize:
  - `dp[0][j] = 0` because `t` can't be subsequence of an empty string.
  - `dp[i][0] = 1` because empty string is a subsequence of any string.
  
![img](https://i.imgur.com/CUpiPuO.png)

Given two strings s and t, return the number of distinct subsequences of s which equals t.

A string's subsequence is a new string formed from the original string by deleting some (can be none) of the characters without disturbing the remaining characters' relative positions. (i.e., "ACE" is a subsequence of "ABCDE" while "AEC" is not).

It is guaranteed the answer fits on a 32-bit signed integer.

**Example**
```
Input: s = "babgbag", t = "bag"
Output: 5
Explanation:
As shown below, there are 5 ways you can generate "bag" from S.
babgbag
babgbag
babgbag
babgbag
babgbag
```

```javascript
/**
 * @param {string} s
 * @param {string} t
 * @return {number}
 */
var numDistinct = function(s, t) {
  let dp = [...Array(s.length+1)].map(e => Array(t.length+1).fill(0));
  
  for (let i = 0; i <= s.length; i++) {
    dp[i][0] = 1;
  }
  for (let i = 1; i <= s.length; i++) {
    for (let j = 1; j <= t.length; j++) {
      if (s[i-1] === t[j-1]) {
        dp[i][j] = dp[i-1][j] + dp[i-1][j-1];
      } else {
        dp[i][j] = dp[i-1][j];
      }
    }
  }
  return dp[s.length][t.length];
};
```