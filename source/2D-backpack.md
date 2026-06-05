---
title: DP - 01 Knapsack problem
date: 2021-09-03 01:52:23
tags:
- leetcode
- dp
---
Given an array of weight `[w0, w1, w2...]` and an array of value `[v0, v1, v2...]` for some items. Pick some items to fill up a backpack whose maximum capacity is `N`, with the biggest sum of values.

**Note:** 
- DP formula is `DP[i][j] = max(DP[i-1][j], DP[i-1][j-weight[i] + value[i])`.
  - Explanation: Use a 2D array to represent items and weights. `DP[i][j]` means the max value of selecting items from `0 - i` and adding them to a bag whose max capacity is `j`.
  - There are two situations for item `i` - pick it or not.
    - Not select `i`, then the sum of value is the same of selecting from `0` to `i-1`.
    - Select `i`, then the sum of value is equal to selecing from `0` to `i-1` but substracting the weight of `i` from the bag.

**How to initialize DP:**
![img](https://code-thinking.cdn.bcebos.com/pics/%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92-%E8%83%8C%E5%8C%85%E9%97%AE%E9%A2%9810.jpg)

```javascript
/**
 * @param {array} weight
 * @param {array} value 
 * @param {integer} bagWeight
 * @return {integer}
**/
function knapsack(weight, value, bagWeight) {
  // Create a 2D array and fill it with 0, otherwise you'll get undefined.
  let dp = [...Array(weight.length)].map(e => Array(bagWeight+1).fill(0));

  // Initialize bags for item 0.
  for (let k = weight[0]; k < bagWeight; k++) {
    dp[0][k] = value[0];
  }

  for (let i = 1; i < weight.length; i++) {
    for (let j = 0; j <= bagWeight; j++) {
      if (j < weight[i]) {
        dp[i][j] = dp[i-1][j];
      } else {
        console.log(dp[i-1][j], dp[i-1][j - weight[i]]);
        dp[i][j] = Math.max(dp[i-1][j], dp[i-1][j - weight[i]] + value[i]);
      }
    }
  }
  return dp[weight.length - 1][bagWeight];  
}
```