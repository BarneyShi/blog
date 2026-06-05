---
title: Leetcode 188 - Best time to buy and sell stock IV
date: 2021-09-20 17:18:51
tags:
- leetcode
- dp
---
**`Note`**
- Basically we need to find the pattern from `III`.
- To initialize the `dp` array, it's not hard to find that `even index` needs to be `0` and `odd index` needs to be `prices[0]`.
- To iterate through `i`, two sitations based on i
  - When i is even, `dp[i][j] = Math.max(dp[i-1][j-1] + prices[i], dp[i-1][j]);`
  - When i is odd, `dp[i][j] = Math.max(dp[i-1][j-1] - prices[i], dp[i-1][j])`

You are given an integer array prices where prices[i] is the price of a given stock on the ith day, and an integer k.

Find the maximum profit you can achieve. You may complete at most k transactions.

Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

**Example**
```
Input: k = 2, prices = [2,4,1]
Output: 2
Explanation: Buy on day 1 (price = 2) and sell on day 2 (price = 4), profit = 4-2 = 2.
```

```javascript
/**
 * @param {number} k
 * @param {number[]} prices
 * @return {number}
 */
var maxProfit = function(k, prices) {
  if (prices.length === 0) return 0;
  let dp = [...Array(prices.length)].map(e => Array(2*k+1).fill(0));
  for (let i = 0; i <= 2*k; i++) {
    if (i % 2 === 0) {
      dp[0][i] = 0;
    } else {
      dp[0][i] = -prices[0];
    }
  }
  for (let i = 1; i < prices.length; i++) {
    for (let j = 0; j <= 2*k; j++) {
      if (j === 0) {
        dp[i][0] = dp[i-1][0];
        continue;
      }
      if (j % 2 === 0) {
        dp[i][j] = Math.max(dp[i-1][j-1] + prices[i], dp[i-1][j]);
      } else {
        dp[i][j] = Math.max(dp[i-1][j-1] - prices[i], dp[i-1][j]);
      }
    }
  }
  return dp[prices.length-1][2*k];
};
```