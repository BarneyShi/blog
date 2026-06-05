---
title: Leetcode 343 - Integer break
date: 2021-09-01 23:58:40
tags:
- leetcode
- dp
---
**`Note`:** 
- `DP[i]` is the maximum product of `i`
- The DP formula is `DP[i] = Max(DP[i], j*(i-j), j*DP[i-j])`. Note that we compare `DP[i]` because when `i` is fixed, we iterate through `j` and we have to make sure that we always keep the biggest `DP[i]` by comparing it with `j*(i-j)`  `j*DP[i-j]`. 
- We have to prefill the result array with `n+1` `0` otherwise it gives us `NaN` because `Math.max(undefined, ...number)` returns `NaN`.

Given an integer n, break it into the sum of k positive integers, where k >= 2, and maximize the product of those integers.

Return the maximum product you can get.

**Example:**
```
Input: n = 2
Output: 1
Explanation: 2 = 1 + 1, 1 × 1 = 1.
```
```
Input: n = 10
Output: 36
Explanation: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36.
```

```javascript
/**
 * @param {number} n
 * @return {number}
 */
var integerBreak = function(n) {
  let dp = [...Array(n+1).fill(0)];
  dp[0] = 0;
  dp[1] = 1;
  for (let i = 2; i <= n; i++) {
    for (let j = 1; j < i; j++) {
      dp[i] = Math.max(dp[i], j*(i-j), dp[j]*(i-j), j*dp[i-j], dp[j]*dp[i-j]);
    }
  }
  return dp[n];
};
```
