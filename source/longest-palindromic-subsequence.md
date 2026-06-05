---
title: Leetcode 516 - Longest palindromic subsequence
date: 2021-09-24 23:29:10
tags:
- dp
---
**`Note`**:
- DP question
- `dp[i][j]` means the longest palindrome in `s[i, j]`.
- To compare `s[i]` and `s[j]`, there are 2 situations:
  - When `s[i] !== s[j]`, we have to separately consider putting either `s[j]` or `s[j]` in `s[i+1, j-1]`. 
    So, it's `dp[i][j] = Math.max(dp[i][j-1], dp[i+1][j])`.
  - When `s[i] === s[j]`, there are also two situations:
    - `i === j`, it's the same char! Then `dp[i][j] = 1`.
    - `i !== j`, 2 different chars, then `dp[i][j] = dp[i+1][j-1] + 2`.


Given a string s, find the longest palindromic subsequence's length in s.

A subsequence is a sequence that can be derived from another sequence by deleting some or no elements without changing the order of the remaining elements.

**Example**
```
Input: s = "bbbab"
Output: 4
Explanation: One possible longest palindromic subsequence is "bbbb".
```

```javascript
/**
 * @param {string} s
 * @return {number}
 */
var longestPalindromeSubseq = function(s) {
  if (s.length === 1) return 1;
  let dp = [...Array(s.length)].map(e => Array(s.length).fill(0));
  for (let i = s.length - 1; i >= 0; i--) {
    for (let j = i; j < s.length; j++) {
      if (s[i] === s[j]) {
        if (i === j) {
          dp[i][j] = 1;
          continue;
        }
        dp[i][j] = dp[i+1][j-1] + 2;
      } else {
        /* Interesting */
        dp[i][j] = Math.max(dp[i][j-1], dp[i+1][j]);
      }
    }
  }
  return dp[0][s.length-1];
};
```