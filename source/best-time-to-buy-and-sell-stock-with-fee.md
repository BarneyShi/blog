---
title: Leetcode 714 - Best time to buy and sell stock with fee
date: 2021-09-20 23:45:24
tags:
- leetcode
- dp
---
**`Note`**
- `DP`
  - Very similar to other stock questions, the only mistake I made was initialize `dp[9][1]`
  - `dp[0][1]` should be `0` instead of `-fee`.
- `Greedy`
  - Looking for `minPrice` to buy and `highPrice` to sell, considering fee.
  - Use `minPrice` to store min price we've met.
  - Be careful of examples like `[1, 4, 10], fee 2`. Certainly, we should buy 1 and sell 4. We paid fee while selling it. But actually the optimal trade is to buy 1 and sell 10. So, we should make `minPrice = 4 - 2` so we won't calculate fees twice when buying 4 and selling 10.

You are given an array prices where prices[i] is the price of a given stock on the ith day, and an integer fee representing a transaction fee.

Find the maximum profit you can achieve. You may complete as many transactions as you like, but you need to pay the transaction fee for each transaction.

Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

**Example**
```
Input: prices = [1,3,2,8,4,9], fee = 2
Output: 8
Explanation: The maximum profit can be achieved by:
- Buying at prices[0] = 1
- Selling at prices[3] = 8
- Buying at prices[4] = 4
- Selling at prices[5] = 9
The total profit is ((8 - 1) - 2) + ((9 - 4) - 2) = 8.
```
**`DP`**
```javascript
/**
 * @param {number[]} prices
 * @param {number} fee
 * @return {number}
 */
var maxProfit = function(prices, fee) {
  let dp = [...Array(prices.length)].map(e => Array(2).fill(0));
  dp[0][0] = -prices[0];
  dp[0][1] = 0;
  
  for (let i = 1; i < prices.length; i++) {
    dp[i][0] = Math.max(dp[i-1][0], dp[i-1][1] - prices[i]);
    dp[i][1] = Math.max(dp[i-1][1], dp[i-1][0] + prices[i] - fee);
  }
  console.log(dp)
  return Math.max(dp[prices.length-1][1], dp[prices.length-1][0]);
};
```

**`Greedy`**
```javascript
/**
 * @param {number[]} prices
 * @param {number} fee
 * @return {number}
 */
var maxProfit = function(prices, fee) {
  let result = 0;
  let minPrice = prices[0];
  for (let i = 1; i < prices.length; i++) {
    if (minPrice + fee < prices[i]) {
      result += prices[i] - minPrice - fee;
      /* IMPORTANT */
      minPrice = prices[i] - fee;
    } else if (prices[i] < minPrice) {
      minPrice = prices[i];
    }
  }
  return result;
};
```