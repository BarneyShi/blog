---
title: Leetcode 674 - Longest continuous increasing subsequence
date: 2021-09-21 15:41:10
tags:
- leetcode
- dp
---
**`Note` **
- `dp[i]` represents the length of the longest continous increasing subsequence that `ends with nums[i]`.
- dp deduction is pretty simple, `dp[i] = dp[i-1] + 1`.
- We still need a `result` to store the longest length we've found so far.

Given an unsorted array of integers nums, return the length of the longest continuous increasing subsequence (i.e. subarray). The subsequence must be strictly increasing.

A continuous increasing subsequence is defined by two indices l and r (l < r) such that it is [nums[l], nums[l + 1], ..., nums[r - 1], nums[r]] and for each l <= i < r, nums[i] < nums[i + 1].

**Example**
```
Input: nums = [1,3,5,4,7]
Output: 3
Explanation: The longest continuous increasing subsequence is [1,3,5] with length 3.
Even though [1,3,5,7] is an increasing subsequence, it is not continuous as elements 5 and 7 are separated by element
4.
```

```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var findLengthOfLCIS = function(nums) {
  let dp = [...Array(nums.length).fill(1)];
  dp[0] = 1;
  let result = 1;
  for (let i = 1; i < nums.length; i++) {
    if (nums[i] > nums[i-1]) {
      dp[i] = dp[i-1] + 1;
    }
    result = Math.max(result, dp[i]);
  }
  return result;
};
```
