---
title: Leetcode 322 - Coin chagne
date: 2021-09-17 18:12:18
tags:
- leetcode
- dp
---

**`Note`**
- This is a `complete knapsack` DP problem.
- Our DP deduction is `dp[j] = Min(dp[j], dp[j-coins[i]])` (we are looking for the `fewest` number). DP[0] = 0. 
- To avoid using uncalculated dp[...], we need to make sure elements dp[1], dp[2]... are all initialized to a really `big number`.

You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

You may assume that you have an infinite number of each kind of coin

**Example**
```
Input: coins = [1,2,5], amount = 11
Output: 3
Explanation: 11 = 5 + 5 + 1
```

```javascript
/**
 * @param {number[]} coins
 * @param {number} amount
 * @return {number}
 */
var coinChange = function(coins, amount) {
  let dp = [...Array(amount+1).fill(Number.MAX_VALUE)];
  dp[0] = 0;
  for (let i = 0; i < coins.length; i++) {
    for (let j = coins[i]; j <= amount; j++) {
      dp[j] = Math.min(dp[j], dp[j - coins[i]] + 1);
    }
  }
  if (dp[amount] == Number.MAX_VALUE) return -1;
  return dp[amount];
};
```
