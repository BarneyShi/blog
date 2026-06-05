---
title: Leetcode 33 - Search in rotated sorted array
date: 2021-11-03 22:42:37
tags:
- binary search
---
**`Note:`**
- Update
  - Don't just compare `nums[middle]` with `target` because `target` can be on either side.
  - Compare `nums[middle]` with `nums[left]` first to check which situation we're talk about.
- Because of the time complexity requirement, we can know we must use `binary search`
- The direction of moving `left, right` pointers depends on where the pivot is, there are two situations:
  - ![img](https://i.imgur.com/wQv14wo.png)
  - We can check the pos of pivot by comparing `left` with `middle`.
- Only by checking `nums[middle] > target` is not enough.
  - For example: ![img](https://i.imgur.com/zW55TqT.png)
  - Both of these two pos of target meet `nums[m] > target`.
  - We need to compare `target` with `left/right` as well.
  
**`Question:`**

There is an integer array `nums` sorted in ascending order (with distinct values).

Prior to being passed to your function, `nums` is possibly rotated at an unknown pivot index `k (1 <= k < nums.length)` such that the resulting array is `[nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]` (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].

Given the array `nums` `after` the possible rotation and an integer target, return the index of target if it is in nums, or `-1` if it is not in nums.

You must write an algorithm with `O(log n)` runtime complexity.

**`Example:`**
```
Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var search = function(nums, target) {
  let left = 0;
  let right = nums.length - 1;
  while (left <= right) {
    if (nums[right] === target) return right;
    if (nums[left] === target) return left;
    const middle = (left + right) >> 1;
    if (target === nums[middle]) {
      return middle;
    }
    if (nums[left] >= nums[middle]) {
      if (nums[middle] < target && target < nums[right]) {
        left = middle + 1;
      } else {
        right = middle - 1;
      }
    } else {
      if (target < nums[middle] && target > nums[left]) {
        right = middle - 1;
      } else {
        left = middle + 1;
      }
    }
  }
  return -1;
};
```