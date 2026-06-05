---
title: Leetcode 643 - Maximum Average Subarray I
date: 2021-12-10 23:30:02
tags:
- sliding window
---
**`Note:`**
- `Sliding window` problem.
- Learned how to write slidign window code elegantly. 

**`Question:`**

You are given an integer array `nums` consisting of `n` elements, and an integer `k`.

Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.

**`Example:`**
```
Input: nums = [1,12,-5,-6,50,3], k = 4
Output: 12.75000
Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var findMaxAverage = function(nums, k) {
  let max = -Infinity;
  let sum = 0;
  for (let i = 0; i < nums.length; i++) {
    // Add cur to sum first.
    sum += nums[i];
    // When i = k - 1, the window is full.
    // Check avg then delete the head so we'll have space for next elem.
    if (i >= k - 1) {
      max = Math.max(max, sum / k);
      sum -= nums[i - k + 1];
    }
  }
  return max;
};
```