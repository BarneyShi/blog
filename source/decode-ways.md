---
title: Leetcode 91 - Decode ways
date: 2021-10-26 23:51:39
tags:
- dp
- dfs
- memorization
---
**`Note:`**
- `DP`
  - `dp[i]` is how many decode ways for `s[0, i-1]`. Don't think it as for substr ending with `s[i]`.
  - Initialize `dp[0] = 1` otherwise the result is incorrect. (?)
  - When `s[i-1] === 0`, if `s[i-2]` is bigger than 2 or it's 0. Then we just return 0 coz there is no valid way to decode. Otherwise, we need to treate `s[i-2,i-1]` as a whole part and `dp[i] = dp[i-2]`.
  - When `s[i-1] !== 0`, if `s[i-2, i-1]` is bigger than 26 or it starts with 0, the only way to decode it is to treat it as a single digit num. Otherwise, `dp[i] = dp[i-1] + dp[i-2]`.

- `DFS with memo`
  - Normal backtracking will TLE coz we did so many repetitive caculations.
  - We need to `memo` the result for each `i`.
  - We don't need result[] or path[] in memo DFS. We return results like in nornal recursion. 
  - Base case: 
    - we reached the end of `s`, which means we've found a way to decode it hence we return `1`.
    - It starts with `0`, we still return `0`.
    - We have to ways to decode s[i], single digit or double-digit
      - We need to `add` them up.
      - But check if the `double-digit` num is valid.
  - Check `memo[i]` before doing recursions.


**`Question:`**

A message containing letters from `A-Z` can be encoded into numbers using the following mapping:
```
'A' -> "1"
'B' -> "2"
...
'Z' -> "26"
```
To decode an encoded message, all the digits must be grouped then mapped back into letters using the reverse of the mapping above (there may be multiple ways). For example, "11106" can be mapped into:

- "AAJF" with the grouping (1 1 10 6)
- "KJF" with the grouping (11 10 6)
Note that the grouping (1 11 06) is invalid because "06" cannot be mapped into 'F' since "6" is different from "06".

Given a string s containing only digits, return the number of ways to decode it.

The answer is guaranteed to fit in a 32-bit integer.

**`Example:`**
```
Input: s = "12"
Output: 2
Explanation: "12" could be decoded as "AB" (1 2) or "L" (12).
```

**`Code:`**

**`DP O(n)`**
```javascript
/**
 * @param {string} s
 * @return {number}
 */
var numDecodings = function (s) {
  let dp = [...new Array(s.length + 1).fill(0)];
  if (s[0] === '0') return 0;
  dp[0] = 1;
  for (let i = 1; i <= s.length; i++) {
    if (s[i-1] !== '0') {
      dp[i] += dp[i-1];
    }
    if (s.slice(i - 2, i) <= '26' && i - 2 >= 0 && s[i-2] !== '0') dp[i] += dp[i - 2];
  }
  return dp[s.length];
};
```

**`DFS with memo`**
```javascript
/**
 * @param {string} s
 * @return {number}
 */
var numDecodings = function (s) {
  let memo = new Map();
  const res = dfs(0);
  return res;

  function dfs(startIndex) {
    if (startIndex >= s.length) return 1;
    if (s[startIndex] === '0') return 0;
    if (memo.has(startIndex)) return memo.get(startIndex);
    let a = 0;
    a = dfs(startIndex + 1);
    let b = 0;
    if (startIndex + 1 < s.length && s.slice(startIndex, startIndex + 2) <= '26') {
      b = dfs(startIndex + 2);
    }
    memo.set(startIndex, a + b);
    return a + b;
  }
};
```