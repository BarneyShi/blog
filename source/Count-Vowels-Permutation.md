---
title: Leetcode 1220 - Count Vowels Permutation
date: 2022-01-16 13:36:51
tags:
- dp
---
**`Note:`**
- Since from the end char of prev permutation, we can get next permutation. It looks like a `DP` problem!
- Let `dp[i][j]` be the number of permutations of a string with length `i` and ending with `vowel[j]`.
- From the rules, we can deduct that 
  - `a` follows `e, i, u`.
  - `e` follows `a, i`.
  - `i` follows `e, o`.
  - `o` follows `i`.
  - `u` follows `o, i`.
- For example, if the vowel is `a`, then it must appear after `e, i, u`, so we can just add the number of permutations that end with `e, i, u`. Then what we get would be the number of permutations ending with `a`.

**`Question:`**

Given an integer n, your task is to count how many strings of length n can be formed under the following rules:

- Each character is a lower case vowel ('a', 'e', 'i', 'o', 'u')
- Each vowel 'a' may only be followed by an 'e'.
- Each vowel 'e' may only be followed by an 'a' or an 'i'.
- Each vowel 'i' may not be followed by another 'i'.
- Each vowel 'o' may only be followed by an 'i' or a 'u'.
- Each vowel 'u' may only be followed by an 'a'.

Since the answer may be too large, return it modulo 10^9 + 7.

**`Example:`**
```
Input: n = 2
Output: 10
Explanation: All possible strings are: "ae", "ea", "ei", "ia", "ie", "io", "iu", "oi", "ou" and "ua".
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @return {number}
 */
var countVowelPermutation = function(n) {
  const dp = [...new Array(n)].map(e => new Array(5).fill(1));
  const MOD = 1000000007;

  for (let i = 1; i < n; i++) {
    dp[i][0] = (dp[i-1][1] + dp[i-1][2] + dp[i-1][4]) % MOD;
    dp[i][1] = (dp[i-1][0] + dp[i-1][2]) % MOD;
    dp[i][2] = (dp[i-1][1] + dp[i-1][3]) % MOD;
    dp[i][3] = dp[i-1][2] % MOD;
    dp[i][4] = (dp[i-1][2] + dp[i-1][3]) % MOD;
  }
  return (dp[n-1][0] + dp[n-1][1] + dp[n-1][2] + dp[n-1][3] + dp[n-1][4]) % MOD;
};
```