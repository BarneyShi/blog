---
title: Leetcode 189 - Rotate array
date: 2021-11-15 00:56:49
tags:
- array
- double pointers
---
**`Note:`**
- When `k === nums.length`, the array will become the same as its initial state. 
- So do `k % len`
- Reverse the whole array first.
- Reverse the first part.
- Reverse the second part.

**`Question:`**

Given an array, rotate the array to the right by k steps, where k is non-negative.

**`Example:`**
```
Input: nums = [1,2,3,4,5,6,7], k = 3
Output: [5,6,7,1,2,3,4]
Explanation:
rotate 1 steps to the right: [7,1,2,3,4,5,6]
rotate 2 steps to the right: [6,7,1,2,3,4,5]
rotate 3 steps to the right: [5,6,7,1,2,3,4]
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var rotate = function(nums, k) {
  k %= nums.length;
  reverse(nums, 0, nums.length - 1);
  reverse(nums, 0, k - 1);
  reverse(nums, k, nums.length - 1);

  function reverse(arr, left, right) {
    while (left < right) {
      [arr[left], arr[right]] = [arr[right], arr[left]];
      left++;
      right--
    }
  }
};
```