---
title: Leetcode 300 - Longest increasing subsequence
date: 2021-09-21 15:18:12
tags:
- leetcode
- dp
---
**`Note`**
- `dp[i]` represents the `length` of the longest subsequence that `ends with nums[i]`.
- We need to for loops, one to iterate `i` from `1 to length-1`, another to iterate `j` from `0 to i-1`. 
  - For every `d[j]`, if `nums[i] > nums[j]`, we add `1` to `dp[j]`, and pick the max between `dp[i]` and `dp[j] + 1`.
- We need a `result` variable to store the longest length we've found so far. Because `dp[length-1]` is not necessarily the biggest value, it only represents the longest increasing subsequence that ends with `dp[length-1]`.

Given an integer array nums, return the length of the longest strictly increasing subsequence.

A subsequence is a sequence that can be derived from an array by deleting some or no elements without changing the order of the remaining elements. For example, [3,6,2,7] is a subsequence of the array [0,3,1,6,2,2,7].

**Example**
```
Input: nums = [10,9,2,5,3,7,101,18]
Output: 4
Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
```

```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var lengthOfLIS = function(nums) {
  let dp = [...Array(nums.length).fill(1)];
  dp[0] = 1;
  let result = 1;
  for (let i = 1; i < nums.length; i++) {
    for (let j = 0; j < i; j++) {
      if (nums[i] > nums[j]) {
        dp[i] = Math.max(dp[i], dp[j] + 1);
      }
    }
    result = Math.max(dp[i], result);
  }
  return result;
};
```