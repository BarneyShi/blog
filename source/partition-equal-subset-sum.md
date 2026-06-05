---
title: Leetcode 416 - Partition equal subset sum
date: 2021-09-04 17:15:30
tags:
- leetcode
- dp
---
Given a non-empty array nums containing only positive integers, find if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.

**Example:**
```
Input: nums = [1,5,11,5]
Output: true
Explanation: The array can be partitioned as [1, 5, 5] and [11].
```
**Note:**
- This is a `01 knapsack` problem.
- The DP formula is `DP[j] = Math.max(DP[j], DP[j - weight[i]] + value[i])`.
- Remember to iterate `num` first.
- Remember the inner loop must be in `descending` order.

```javascript
/**
 * @param {number[]} nums
 * @return {boolean}
 */
var canPartition = function(nums) {
  let sum = nums.reduce((acc, cur) => acc + cur, 0);

  // When the sum is not even, there is no way to find a qualified subset.
  if (sum % 2 !== 0) return false;
  
  let dp = [...Array(sum/2 + 1).fill(0)];
  for (let i = 0; i < nums.length; i++) {
    for (let j = sum/2; j >= nums[i]; j--) {
      dp[j] = Math.max(dp[j], dp[j - nums[i]] + nums[i]);
    }
  }
  return dp[sum/2] == sum/2;
};
```
