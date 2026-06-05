---
title: Leetcode 34 - Find first and last position of element in sorted array
date: 2021-10-27 21:38:57
tags:
- double pointers
---
**`Note:`**
- Update:
  - Just use 2 binary search.
  - Pre-check `nums[middle - 1]` and `nums[middle + 1]` in case we're right on the boundary!
- The required time complexity is `O(logn)`, so we need to use `binary search`, and DON'T USE `DOUBLE POINTERS`!
- Double pointers is `O(n)` but not `O(logn)`.
- Take findLeftBoundary for example:
  - When `nums[middle] < target`, `left = middle + 1`.
  - When `nums[middle] > target`, `right = middle - 1`.
  - When `nums[middle] === target`, `left` must be on the left side. But we need to check edge cases:
    - `middle === 0` or `nums[middle - 1] !== target`. Return middle in this case.
    - Otherwise `right = middle - 1`;

**`Question:`**

Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

If target is not found in the array, return [-1, -1].

You must write an algorithm with O(log n) runtime complexity.

**`Example:`**
```
Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var searchRange = function (nums, target) {
  return [findLeftBoundary(nums, target), findRightBoundary(nums, target)];

  function findLeftBoundary(arr, target) {
    let left = 0;
    let right = arr.length - 1;
    while (left < right) {
      const middle = (left + right) >> 1;
      if (arr[middle] === target) {
        if (nums[middle - 1] !== target) {
          return middle;
        }
        right = middle - 1;
      } else if (arr[middle] > target) {
        right = middle - 1;
      } else {
        left = middle + 1;
      }
    }
    return nums[left] === target ? left : -1;
  }
  function findRightBoundary(arr, target) {
    let left = 0;
    let right = arr.length - 1;
    while (left < right) {
      const middle = (left + right) >> 1;
      if (arr[middle] === target) {
        if (nums[middle + 1] !== target) {
          return middle;
        }
        left = middle + 1;
      } else if (arr[middle] > target) {
        right = middle - 1;
      } else {
        left = middle + 1;
      }
    }
    return nums[left] === target ? left : -1;
  }
};
```