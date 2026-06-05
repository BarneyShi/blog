---
title: Leetcode 123 - Best time to buy and sell stock III
date: 2021-09-20 04:05:28
tags:
- leetcode
- dp
---
**`Note`**
- We use `4` states to represent the state of each day (It doesn't mean each state happens on the day, could be in the past).
   - `0` no operation since day0.
   - `1` buy a stock for the 1st time `before today` or `today`.
   - `2` sell a stock for the 1st time `before today` or `today`.
   - `3` buy a stock 2rd time `before today` or `today`.
   - `4` sell a stock 2rd time `before today` or `today`.
- The most profitable operation must be at `dp[price.length-1][4]`.

You are given an array prices where prices[i] is the price of a given stock on the ith day.

Find the maximum profit you can achieve. You may complete at most two transactions.

Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

**Example**
```
Input: prices = [3,3,5,0,0,3,1,4]
Output: 6
Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.
```

```javascript
/**
 * @param {number[]} prices
 * @return {number}
 */
var maxProfit = function(prices) {
  let dp = [...Array(prices.length)].map(e => Array(2).fill(0));
  dp[0][0] = 0, dp[0][1] = -prices[0], dp[0][2] = 0, dp[0][3] = -prices[0], dp[0][4] = 0;
  
  for (let i = 1; i < prices.length; i++) {
    dp[i][0] = dp[i-1][0];
    dp[i][1] = Math.max(dp[i-1][1], dp[i-1][0] - prices[i]);
    dp[i][2] = Math.max(dp[i-1][1] + prices[i], dp[i-1][2]);
    dp[i][3] = Math.max(dp[i-1][2] - prices[i], dp[i-1][3]);
    dp[i][4] = Math.max(dp[i-1][3] + prices[i], dp[i-1][4]);
  }
  return dp[prices.length-1][4];
};
```