---
title: Leetcode 518 - Coin changes II
date: 2021-09-07 00:45:04
tags:
- leetcode
- dp
---
**`Note:`**
- This is a `complete knapsack` problem.
- This can be done in `1D` array.
- We have to iterate `i` first because we `{1, 2}` and `{2, 1}` are considered one same result.
- We have to iterate `j` in `ascending` order because what we want is exactly to add a `same` item `multi` times. (Compared to nornal `01 knapsack` problem)

You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

Return the number of combinations that make up that amount. If that amount of money cannot be made up by any combination of the coins, return 0.

You may assume that you have an infinite number of each kind of coin.

The answer is guaranteed to fit into a signed 32-bit integer.

**Example:**
```
Input: amount = 5, coins = [1,2,5]
Output: 4
Explanation: there are four ways to make up the amount:
5=5
5=2+2+1
5=2+1+1+1
5=1+1+1+1+1
```

```javascript
/**
 * @param {number} amount
 * @param {number[]} coins
 * @return {number}
 */
var change = function(amount, coins) {
  let dp = [...Array(amount + 1).fill(0)];
  dp[0] = 1;
  for (let i = 0; i < coins.length; i++) {
    for (let j = coins[i]; j <= amount; j++) {
      dp[j] += dp[j - coins[i]];
    }
  }
  return dp[amount];
};
```