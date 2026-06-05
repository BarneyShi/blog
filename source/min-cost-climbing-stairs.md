---
title: Leetcode 746 - Min cost climbing stairs
date: 2021-08-30 01:44:10
tags:
- leetcode
- dp
---
You are given an integer array cost where cost[i] is the cost of ith step on a staircase. Once you pay the cost, you can either climb one or two steps.
You can either start from the step with index 0, or the step with index 1.
Return the minimum cost to reach the top of the floor.

**Example 1:**
```
Input: cost = [10,15,20]
Output: 15
Explanation: Cheapest is: start on cost[1], pay that cost, and go to the top.
```
**Note:** The DP formula is `dp[i] = min(dp[i-1], dp[i-2]) + cost[i]`. 

```javascript
/**
 * @param {number[]} cost
 * @return {number}
 */
var minCostClimbingStairs = function(cost) {
  let dp = [];
  dp[0] = cost[0];
  dp[1] = cost[1];
  for (let i = 2; i < cost.length; i++) {
    dp[i] = Math.min(dp[i-1], dp[i-2]) + cost[i];
  }
  return Math.min(dp[cost.length-1], dp[cost.length-2]);
};
```
