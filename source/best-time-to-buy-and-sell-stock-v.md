---
title: Leetcode 309 - Best time to buy and sell stock V
date: 2021-09-20 18:24:30
tags:
- leetcode
- dp
---
**`Note`**
- Very similar to other stock questions, we need `4 state` in this problem
  - `0` holds a stock
  - `1` sold today
  - `2` cooldown period
  - `3` off cooldown
- The result might `not` be in `dp[i][3]`, we need to compare state 1, 2, and 3.

You are given an array prices where prices[i] is the price of a given stock on the ith day.

Find the maximum profit you can achieve. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times) with the following restrictions:

  - After you sell your stock, you cannot buy stock on the next day (i.e., cooldown one day).

Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

**Example**
```
Input: prices = [1,2,3,0,2]
Output: 3
Explanation: transactions = [buy, sell, cooldown, buy, sell]
```

```javascript
/**
 * @param {number[]} prices
 * @return {number}
 */
var maxProfit = function(prices) {
  if (prices.length === 0) return 0;
  let dp = [...Array(prices.length)].map(e => Array(4).fill(0));
  dp[0][0] = -prices[0];
  // Sold today
  dp[0][1] = 0;
  // Cooldown
  dp[0][2] = 0;
  // Normal
  dp[0][3] = 0;
  
  for (let i = 1; i < prices.length; i++) {
    dp[i][0] = Math.max(dp[i-1][0], dp[i-1][2] - prices[i], dp[i-1][3] - prices[i]);
    dp[i][1] = dp[i-1][0] + prices[i];
    dp[i][2] = dp[i-1][1];
    dp[i][3] = Math.max(dp[i-1][3], dp[i-1][2]);
  }
  return Math.max(dp[prices.length-1][1], dp[prices.length-1][2], dp[prices.length-1][3]);
};
```