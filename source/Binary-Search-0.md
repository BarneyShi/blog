---
title: Leetcode 704 - Binary Search
date: 2021-12-23 04:39:54
tags:
- binary search
---
**`Note:`**

- To find the `target` but not `first element bigger than or equal to target`, or `last element smaller than or equal to target`, use `<=`, and we don't need a last check on `nums[left]` with `target`.
- Don't need `add 1` to `left + right >> 1` because there won't be infinite loops, and we won't miss any ans.

**`Question:`**

Given an array of integers `nums` which is sorted in ascending order, and an integer `target`, write a function to search `target` in `nums`. If `target` exists, then return its index. Otherwise, return `-1`.

You must write an algorithm with `O(log n)` runtime complexity.

**`Example:`**
```
Input: nums = [-1,0,3,5,9,12], target = 9
Output: 4
Explanation: 9 exists in nums and its index is 4
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var search = function(nums, target) {
  let left = 0, right = nums.length - 1;
  while (left <= right) {
    const mid = (left + right) >> 1;
    if (nums[mid] === target) {
      return mid;
    } else if (nums[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return -1;
};
```