---
title: Leetcode 747 - Largest Number At Least Twice of Others
date: 2021-12-26 21:16:50
tags:
---
**`Note:`**
- Easy question. Get max and its index.
- Sort the array, and because every element is unique, we can compare max and it's prev element.

**`Question:`**

You are given an integer array `nums` where the largest integer is unique.

Determine whether the largest element in the array is at least twice as much as every other number in the array. If it is, return the index of the largest element, or return `-1` otherwise.

**`Example:`**
```
Input: nums = [3,6,1,0]
Output: 1
Explanation: 6 is the largest integer.
For every other number in the array x, 6 is at least twice as big as x.
The index of value 6 is 1, so we return 1.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var dominantIndex = function(nums) {
  if (nums.length === 1) return 0;
  let index = 0, max = 0;
  for (let i = 0; i < nums.length; i++) {
    if (nums[i] > max) {
      index = i;
      max = nums[i];
    }
  }
  nums.sort((a, b) => a - b);
  if (nums[nums.length - 1] / nums[nums.length - 2] < 2) return -1;
  return index;
};
```