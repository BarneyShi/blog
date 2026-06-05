---
title: Leetcode 81 - Search in rotated sorted array II
date: 2021-11-24 03:28:49
tags:
- double pointers
---
**`Note:`**
- Find the `middle = left + right / 2`.
- But because it has `duplicates`, when `nums[left] == nums[right] == nums[middle]`,
  - Such as `[1,1,1,2,1,1,1,1,1,1,1]` or `[1,1,1,1,1,1,1,1,2,1,1]` with target `2`.
  - There is no way we can tell `2` is on the `left` of middle or `right`.
- What should we do? 
  - Move both `left` and `right` by 1.
- Use `nums[midlle] <= nums[right]` to check which part the middle is in.
- We should use `<=` as the condition of `while` so that we don't need an extra check on `nums[left] === target`.

**`Question:`**

There is an integer array `nums` sorted in `non-decreasing` order (not necessarily with distinct values).

Before being passed to your function, `nums` is rotated at an unknown pivot index `k` (`0 <= k < nums.length`) such that the resulting array is `[nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]` (0-indexed). For example, [0,1,2,4,4,4,5,6,6,7] might be rotated at pivot index 5 and become [4,5,6,6,7,0,1,2,4,4].

Given the array `nums` after the rotation and an integer `target`, return `true` if target is in nums, or `false` if it is not in nums.

You must decrease the overall operation steps as much as possible.

**`Example:`**
```
Input: nums = [2,5,6,0,0,1,2], target = 0
Output: true
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {boolean}
 */
var search = function(nums, target) {
  let left = 0, right = nums.length - 1;
  while (left <= right) {
    const middle = left + ((right - left ) >> 1);
    if (nums[middle] === target) return true;
    if (nums[middle] === nums[left] && nums[middle] === nums[right]) {
      left++;
      right--;
    } else if (nums[middle] <= nums[right]) {
      if (target > nums[middle] && target <= nums[right]) {
        left = middle + 1;
      } else {
        right = middle - 1;
      }
    } else {
      if (target < nums[middle] && target >= nums[left]) {
        right = middle - 1;
      } else {
        left = middle + 1;
      }
    }
  }
  return false; 
};
```