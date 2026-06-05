---
title: Leetcode 122 - Best time to buy and sell stock II
date: 2021-09-20 01:35:42
tags:
- leetcode
- dp
---
**`Note`**
- `DP`
  - It's really similar to buy and sell I, but with only one difference.
  - When calculating `dp[i][0]`, there are two situations:
    - We already have a stock yesterday and hold it through today.
    - We bought a stock today, but because we can sell and buy multi times, we need to include `profits from the past`, which is `dp[i-1][1]`, then substract `prices[i]` from it.
    - There is actually a third situation, you have a stock yesterday and you sold it today, then you bought it again on the same day. It's `dp[i][0] = dp[i-1][0]+prices[i]-prices[i]`. As you can see, it's still `dp[i-1][0]`, same as situation 1.
- `Greedy`
  - We might think it's hard to find a day with really low price to buy and a day with high price to sell, but actually, the profits can be dissected.
  - Take `[1, 3, 2, 7]`, `buy 1 sell 7 === buy 1 sell 3 + buy 2 sell 7`
  - Which means we only need to buy and sell when `prices[i] > prices[i-1]`

You are given an integer array prices where prices[i] is the price of a given stock on the ith day.

On each day, you may decide to buy and/or sell the stock. You can only hold at most one share of the stock at any time. However, you can buy it then immediately sell it on the same day.

Find and return the maximum profit you can achieve.

**Example**
```
Input: prices = [7,1,5,3,6,4]
Output: 7
Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
Total profit is 4 + 3 = 7.
```
**`DP`** O(n)
```javascript
/**
 * @param {number[]} prices
 * @return {number}
 */
var maxProfit = function(prices) {
  let dp = [...Array(prices.length)].map(e => Array(2).fill(0));
  dp[0][0] = -prices[0];
  dp[0][1] = 0;
  for (let i = 1; i < prices.length; i++) {
    dp[i][0] = Math.max(dp[i-1][0], dp[i-1][1]-prices[i]);
    dp[i][1] = Math.max(dp[i-1][1], dp[i-1][0]+prices[i]);
  }
  return dp[prices.length-1][1];
};
```

**`Greedy`** O(n)
```javascript
/**
 * @param {number[]} prices
 * @return {number}
 */
var maxProfit = function(prices) {
  let result = 0;
  for (let i = 1; i < prices.length; i++) {
    if (prices[i] > prices[i-1]) {
      result += prices[i] - prices[i-1]
    }
  }
  return result;
};
```