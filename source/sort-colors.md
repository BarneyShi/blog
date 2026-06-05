---
title: Leetcode 75 - Sort colors
date: 2021-11-09 21:43:19
tags:
- double pointers
---
**`Note:`**
- `Double pointers with 2 passes`.
  - Move all `2`s to the end.
  - Move all `0`s to the start.
- `Double pointers with single iteration`
  - `p0` and `p1`.
  - If `nums[i] === 1`, just `swap(nums[i], p1)`.
  - However, for 0, we need to consider caes like 
  - `1,1,1,2,0`. Assume right now `p1` is pointing at `2` but `p1` is at the first 1. If we just swap `0` and the `first 1`, it's not correct (`0,1,1,2,1`). We need anotehr step to `swap(p1, nums[i])` - (`0,1,1,1,2`). 

**`Question:`**

Given an array nums with `n` objects colored red, white, or blue, sort them `in-place` so that objects of the same color are adjacent, with the colors in the order red, white, and blue.

We will use the integers `0`, `1`, and `2` to represent the color red, white, and blue, respectively.

You must solve this problem without using the library's sort function.

**`Example:`**
```
Input: nums = [2,0,2,1,1,0]
Output: [0,0,1,1,2,2]
```

**`Code:`**
**`Double pointers with single iteration`**
```javascript
/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var sortColors = function(nums) {
  let p0 = 0, p1 = 0;
  for (let i = 0; i < nums.length; i++) {
    if (nums[i] === 1) {
      [nums[i], nums[p1]] =[nums[p1], nums[i]];
      p1++;
    } else if (nums[i] === 0) {
      [nums[i], nums[p0]] =[nums[p0], nums[i]];
      if (p0 < p1) {
        [nums[i], nums[p1]] =[nums[p1], nums[i]];
      }
      p1++;
      p0++;
    }
  }
};
```

**`Single pointer`**
```javascript
/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var sortColors = function (nums) {
  let left = 0;
  let right = nums.length - 1;
  while (left < right) {
    while (nums[right] === 2) {
      right--;
    }
    if (right > 0 && nums[left] === 2) {
      [nums[left], nums[right]] = [nums[right], nums[left]];
      while (nums[right] === 2) {
        right--;
      }
    } else {
      left++;
    }
  }
  left = 0;
  while (left < right) {
    while (nums[right] === 1) {
      right--;
    }
    if (nums[left] === 1 && right > 0) {
      [nums[left], nums[right]] = [nums[right], nums[left]];
      while (nums[right] === 1) {
        right--;
      }
    } else {
      left++;
    }
  }
};
```
**`Bubble sort`**
```javascript
/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var sortColors = function(nums) {
  for (let i = 0; i < nums.length; i++) {
    for (let j = 0; j < nums.length; j++) {
      if (j < nums.length - 1 && nums[j] > [nums[j + 1]]) {
        [nums[j], nums[j + 1]] = [nums[j + 1], nums[j]];
      }
    }
  }
};
```