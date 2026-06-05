---
title: Leetcode 5 - Longest palindromic substring
date: 2022-05-12 02:13:04
tags:
- dp
---
**`Note:`**
- My guts tell me this is a DP question.
- `DP[i][j]` means whether substring from `i` to `j` is a palindrome.
- Use `i` and `j` to represent `start` and `end` of a substring.
- Note that `dp[i][j]` is `true` when `dp[i+1][j-1]` is `true`.
- Run time `O(n^2)`.

**`Question:`**

Given a string s, return the longest palindromic substring in s.

**`Example:`**
```
Input: s = "babad"
Output: "bab"
Explanation: "aba" is also a valid answer.
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {string}
 */
var longestPalindrome = function(s) {
  if (s.length === 1) return s;
  let dp = [...new Array(s.length)].map(e => new Array(s.length).fill(false));
  for (let i = 0; i < s.length; i++) {
    dp[i][i] = true;
  }

  let start = 0;
  let end = 0;
  for (let j = 1; j < s.length; j++) {
    for (let i = 0; i < j; i++) {
      // Note the `j - i < 3` here. We need to check it in case `i+1 > j-1` or `i+1 = j-1`.
      if (s[i] === s[j] && (j - i < 3 || dp[i+1][j-1])) {
        dp[i][j] = true;
        if (j - i > end - start) {
          start = i;
          end = j;
        }
      }
    }
  }
  return s.substring(start, end + 1);
};
```