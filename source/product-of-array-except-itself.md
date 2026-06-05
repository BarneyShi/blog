---
title: Leetcode 238 - Product of array except itself
date: 2021-10-17 22:48:50
tags:
- array
---
**`Note:`**
- It says we cannot use `Division`!
- `nums[i] = left product * right product`.
- Build an array `result`, first we need to iterate from left to right, fill each element as product of left side elements while updating `left *= nums[i]`.
- Then, we iterate from right, multiply `right product` while keep updating variable `right *= nums[i]`.

**`Question:`**

Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

The product of any prefix or suffix of nums is `guaranteed` to fit in a 32-bit integer.

You must write an algorithm that runs in O(n) time and without using the division operation.

**`Example:`**
```
Input: nums = [1,2,3,4]
Output: [24,12,8,6]
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number[]}
 */
var productExceptSelf = function (nums) {
  let left = 1, right = 1;
  let result = [];
  for (let i = 0; i < nums.length; i++) {
    result[i] = left;
    left *= nums[i];
  }
  for (let i = nums.length - 1; i >= 0; i--) {
    result[i] *= right;
    right *= nums[i];
  }
  return result;
};
```