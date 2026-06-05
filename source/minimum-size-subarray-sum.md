---
title: Leetcode 209 - Minimum size subarray sum
date: 2021-08-24 21:54:56
tags:
- leetcode
- medium
- array
- double pointers
---
Given an array of positive integers nums and a positive integer target, return the minimal length of a contiguous subarray [numsl, numsl+1, ..., numsr-1, numsr] of which the sum is greater than or equal to target. If there is no such subarray, return 0 instead.

**Note:** For questions like finding a `subarray` that fits some requirements, `sliding window` is usually the way to go.

**Example 1:**
```
Input: target = 7, nums = [2,3,1,2,4,3]
Output: 2
Explanation: The subarray [4,3] has the minimal length under the problem constraint.
```
```javascript
/**
 * @param {number} target
 * @param {number[]} nums
 * @return {number}
 */
var minSubArrayLen = function(target, nums) {
  let left = 0, right = 0;
  let sum = 0, length = Infinity;
  while (right < nums.length) {
    sum += nums[right];
    if (sum < target) {
      right++;
    } else {
      while (sum >= target) {
        length = Math.min(length, right - left + 1);
        sum -= nums[left];
        left++;
      }
      right++;
    }
  }
  return length === Infinity ? 0 : length;
};
```