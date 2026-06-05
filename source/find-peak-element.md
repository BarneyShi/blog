---
title: Leetcode 162 - Find peak element
date: 2021-10-29 18:03:05
tags:
- greedy
- binary search
---
**`Note:`**
- By the description, we need to use `binary search`.
- But the array is not sorted, how should we know which direction we need to move?
- Always move toward the element with `bigger value`!
- Imagine we always do this, eventually when we hit `0` or `len - 1`, both `nums[-1]` or `nums[len]` are `-Infinity`. We can definitely get `nums[i]` bigger than its neighbors. 

**`Question:`**

A peak element is an element that is `strictly greater` than its neighbors.

Given an integer array nums, find a peak element, and return its index. If the array contains multiple peaks, return the index to any of the peaks.

You may imagine that nums[-1] = nums[n] = -∞.

You must write an algorithm that runs in `O(log n)` time.

**`Example:`**
```
Input: nums = [1,2,3,1]
Output: 2
Explanation: 3 is a peak element and your function should return the index number 2.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var findPeakElement = function(nums) {
  let res = -1;
  let left = 0, right = nums.length - 1;
  nums[-1] = -Infinity
  nums[nums.length] = -Infinity;
  while (left <= right) {
    const middle = left + ~~((right - left) / 2);
    if (nums[middle] > nums[middle - 1] && nums[middle] > nums[middle + 1]) {
      return middle;
    } else if (nums[middle + 1] >= nums[middle - 1]) {
      left = middle + 1;
    } else if (nums[middle + 1] <= nums[middle - 1]) {
      right = middle - 1;
    }
  }
};
```