---
title: Leetcode 689 - Max sum of 3 non-overlapping subarrays
date: 2021-12-07 16:48:23
tags:
- sliding window
---
**`Note:`**
- How to find the max sum of `2 non-overlapping subs`?
  - Start from `k`, for the second array, keep tracking of the `maxSum1`. 
  - Because in every iteration the `first` array that contains `maxSum1` must have appeared before the `second` array. We can be sure that they are not overlapping.
- How to find the max sum of `3 non-overlapping subs`?
  - Start from `2k`, for the `3rd` array, keep tracking `maxSum1` and `maxSum12`.
  - Because we've made sure that `1st` and `2nd` arrays won't overlap, the `3rd` array appears after them, so it won't overlap either.
- An overlooked detail:
  - `maxSum1Index` doesn't necessarily equal to `maxSum12Index`. Because a num might be `bigger than maxSum1`, but `num + sum2 < maxSum12`. So `maxSum12Index1` and `maxSum12Index2` must be set only when `maxSum1 + sum > maxSum12`.

**`Question:`**

Given an integer array `nums` and an integer `k`, find three non-overlapping subarrays of length `k` with maximum sum and return them.

Return the result as a list of indices representing the starting position of each interval (0-indexed). If there are multiple answers, return the lexicographically smallest one.

**`Example:`**
```
Input: nums = [1,2,1,2,6,7,5,1], k = 2
Output: [0,3,5]
Explanation: Subarrays [1, 2], [2, 6], [7, 5] correspond to the starting indices [0, 3, 5].
We could have also taken [2, 1], but an answer of [1, 3, 5] would be lexicographically larger.
```

**`Code:`**

**`Introduction: Max sum of 2 non-overlapping subarrays`**
```javascript
function maxSumTwoSubaarrays(nums, k) {
  let ans = [0, 0];
  let sum1 = 0, sum2 = 0, maxSum1 = 0, maxSum12 = 0, maxSum1Index = 0;
  for (let i = k; i < nums.length; i++) {
    sum1 += nums[i - k];
    sum2 += nums[i];
    if (i >= 2*k - 1) {
      if (sum1 > maxSum1) {
        maxSum1 = sum1;
        maxSum1Index = i - 2*k + 1;
      }
      if (maxSum1 + sum2 > maxSum12) {
        maxSum12 = maxSum1 + sum2;
        ans = [maxSum1Index, i - k + 1];
      }
      sum1 -= nums[i - 2*k + 1];
      sum2 -= nums[i - k + 1];
    }
  }
  return ans;
}
```
**`Max sum of 3 non-overlapping subarrays`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
var maxSumOfThreeSubarrays = function(nums, k) {
  let ans = [0, 0, 0];
  let sum1 = 0, sum2 = 0, sum3 = 0;
  let maxSum1 = 0, maxSum12 = 0, maxSumTotal = 0;
  let maxSum1Index = 0, maxSum12Idx1 = 0, maxSum12Idx2 = 0;
  for (let i = 2*k; i < nums.length; i++) {
    sum1 += nums[i - 2*k];
    sum2 += nums[i - k];
    sum3 += nums[i];
    if (i >= 3*k - 1) {
      if (sum1 > maxSum1) {
        maxSum1 = sum1;
        maxSum1Index = i - 3*k + 1;
      }
      if (maxSum1 + sum2 > maxSum12) {
        maxSum12 = maxSum1 + sum2;
        maxSum12Idx1 = maxSum1Index;
        maxSum12Idx2 = i - 2*k + 1;
      }
      if (maxSum12 + sum3 > maxSumTotal) {
        maxSumTotal = maxSum12 + sum3;
        ans = [maxSum12Idx1, maxSum12Idx2, i - k + 1];
      }
      sum1 -= nums[i - 3*k + 1];
      sum2 -= nums[i - 2*k + 1];
      sum3 -= nums[i - k + 1];
    }
  }
  return ans;
};
```