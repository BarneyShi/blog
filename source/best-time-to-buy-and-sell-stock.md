---
title: Leetcode 121 - Best time to buy and sell stock
date: 2021-09-19 22:57:06
tags:
- leetcode
- dp
---
**`Note`**
- DP1 deduction: `dp[i] = max(dp[i-1], price[i] - min element between 0 and i-1)`.
- Use `min` to remember previous min and compare with `price[i]` so we don't need to calculate min every time from array [0, i-1].
- DP2 uses a 2D array. `DP[i][0]` means the most money an investor has if he `owns` a stock.
  - dp[i][0] = Math.max(dp[i-1][0], -prices[i]); (`Note`: it's `-prices[i]` instead of `dp[i-1][1]-prices[i]` because we can only buy and sell once)
- `DP[i][1]` means the most money an investors has if he `doesn't own` a stock.
  - dp[i][1] = Math.max(dp[i-1][1], prices[i]+dp[i-1][0]);


You are given an array prices where prices[i] is the price of a given stock on the ith day.

You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

**Example**
```
Input: prices = [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
```
**`DP1`**
```javascript
/**
 * @param {number[]} prices
 * @return {number}
 */
var maxProfit = function(prices) {
  if (prices.length === 1) return 0;
  let res = 0;
  let min = prices[0];
  for (let i = 1; i < prices.length; i++) {
    res = Math.max(res, prices[i] - min);
    min = Math.min(min, prices[i]);
  }
  return res;
};
```

**`DP2`**
```javascript
/**
 * @param {number[]} prices
 * @return {number}
 */
var maxProfit = function(prices) {
  let dp = [...Array(prices.length).fill([0,0])];
  dp[0][0] = -prices[0];
  dp[0][1] = 0;
  
  for (let i = 1; i < prices.length; i++) {
    dp[i][0] = Math.max(dp[i-1][0], -prices[i]);
    dp[i][1] = Math.max(dp[i-1][1], prices[i]+dp[i-1][0]);
  }
  return dp[prices.length-1][1];
};
```
