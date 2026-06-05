---
title: Leetcode 213 - House robber II
date: 2021-09-19 02:14:28
tags:
- leetcode
- dp
---
**`Note`**
- Consider two situations, pick the `last one` and not.
- If we pick the last one, then we cannot pick the first one. Build an array whose length is `nums.length-1` and iterate from `nums[1]` to `nums[nums.length-1]`/
- If we don't pick the last one, then we must pick the first one. Build an array with length `nums.length-1` and iterate from `nums[0]` to `nums[nums.length-2]`.

You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have a security system connected, and it will automatically contact the police if two adjacent houses were broken into on the same night.

Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

**Example**
```
Input: nums = [2,3,2]
Output: 3
Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2), because they are adjacent houses.
```

```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var rob = function(nums) {
  if (nums.length === 1) return nums[0];
  let dp1 = [...Array(nums.length-1).fill(0)];
  let dp2 = [...Array(nums.length-1).fill(0)];
  dp1[0] = nums[0];
  dp1[1] = Math.max(nums[0], nums[1]);
  dp2[0] = nums[1];
  dp2[1] = Math.max(nums[1], nums[2]);
  for (let i = 2; i < nums.length-1; i++) {
    dp1[i] = Math.max(dp1[i-1], dp1[i-2] + nums[i]);
    dp2[i] = Math.max(dp2[i-1], dp2[i-2] + nums[i+1]);
  }
  return Math.max(dp1[nums.length-2], dp2[nums.length-2]);
};
```