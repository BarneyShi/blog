---
title: Leetcode 629 - K inverse pairs array
date: 2021-11-10 17:12:03
tags:
- dp
---
**`Note:`**
- Based on the range of `k` an `n`, it's easy to tell that `BFS/DFS` will TLE.
- For questions like the `number of combinations`, it's usually `DP`.
- `dp[i][j]` means how many `combinations` to get `j` paris using `[1, i]`.
- Thoughts:
  - Take `dp[4][2]` for example, 
  - ![img](https://i.imgur.com/Yrhtr0K.jpg)
  - We can learn the pattern `DP[4][2] = DP[3][2] + DP[3][1] + DP[3][0]`.
  - The deduction is:
  - ![img](https://i.imgur.com/Nxwx36V.png)
  - How do we get the bound `[0, i-1]` ? 
    - Explaination: When we insert `n` into the `end of [0, n-1]`, there is no more new pairs. When we insert `n` into the `start of [0, n-1]`. We generated another `n - 1` pairs with `[0, n-1]`.
  - We can get the dp deduction by: ![img](https://i.imgur.com/w92IHwU.png)
- Initialize dp as `dp[i][0] === 1`.
- Details:
  - Need to check if `j >= i`, otherwise `dp[i-1][j-i]` doesn't make sense.
  - `dp[i][j]` might be negative. so if it it, to get the `mod of a negative number`, we have to add `MOD` to it first.

**`Question:`**

For an integer array `nums`, an inverse pair is a pair of integers `[i, j]` where `0 <= i < j < nums.length` and `nums[i] > nums[j]`.

Given two integers n and k, return the number of different arrays consist of numbers from `1` to `n` such that there are exactly `k` inverse pairs. Since the answer can be huge, return it modulo `10^9 + 7`.

**`Example:`**
```
Input: n = 3, k = 1
Output: 2
Explanation: The array [1,3,2] and [2,1,3] have exactly 1 inverse pair.
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @param {number} k
 * @return {number}
 */
var kInversePairs = function(n, k) {
  const MOD = 10**9 + 7;
  let dp = [...Array(n + 1)].map(e => Array(k + 1).fill(0));
  dp[0][0] = 1;
  for (let i = 1; i <= n; i++) {
    dp[i][0] = 1;
    for (let j = 1; j <= k; j++) {
      dp[i][j] = dp[i][j-1] + dp[i-1][j];
      // Need to check if j > i.
      if (j >= i) {
        dp[i][j] -= dp[i-1][j-i];
      }
      // dp[i][j] might be negative, for example, -5 % 6 should be 1. So, add mod to it first.
      if (dp[i][j] < 0) dp[i][j] += MOD;
      dp[i][j] = dp[i][j] % MOD
    }
  }
  return dp[n][k];
};
```