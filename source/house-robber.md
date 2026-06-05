---
title: Leetcode 198 - House robber
date: 2021-09-19 00:25:35
tags:
- leetcode
- dp
---
**`Note`**
- Don't assume any dp probem is either `01` or `complete` knapsack problem. This question is more like `fibonacci`.
- DP[i] represents the biggest sum of values between `nums[0]...nums[i]`.
- The DP deduction is `dp[i] = max(dp[i-1], dp[i-2] + nums[i])`.

You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

**Example**
```
Input: nums = [1,2,3,1]
Output: 4
Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
Total amount you can rob = 1 + 3 = 4.
```

```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var rob = function(nums) {
  let dp = [...Array(nums.length).fill(0)];
  dp[0] = nums[0];
  dp[1] = Math.max(nums[0], nums[1]);
  
  for (let i = 2; i <= nums.length; i++) {
    dp[i] = Math.max(dp[i-1], dp[i-2] + nums[i]);
  }
  return dp[nums.length-1];
};
```