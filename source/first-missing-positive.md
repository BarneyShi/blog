---
title: Leetcode 41 - First missing positive
date: 2021-11-14 23:13:33
tags:
- hash table
---
**`Note:`**
- Because of the limit of `O(1)` extra space. We cannot create another array or map.
- We should make the most of `nums`.
- Let's use `in-place hash`.
- For each `nums[i]`, let's put it back to index `nums[i] - 1` in the first itreation.
- In the second iteration, if there is an element that doesn't belong to its `index`, it's the result.
- If every element is at the right position, return `nums[len - 1] + 1`.
- To avoid loop hole, we need a check if `nums[nums[i] - 1] !== nums[i]`.

**`Question:`**

Given an unsorted integer array nums, return the smallest missing positive integer.

You must implement an algorithm that runs in O(n) time and uses constant extra space.

**`Example:`**
```
Input: nums = [7,8,9,11,12]
Output: 1

Input: nums = [1,2,0]
Output: 3
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var firstMissingPositive = function(nums) {
  for (let i = 0; i < nums.length; i++) {
    // This check is important
    while (nums[i] >= 0 && nums[i] - 1 < nums.length && nums[nums[i] - 1] !== nums[i]) {
      let tmp = nums[i];
      nums[i] = nums[nums[i] - 1];
      nums[tmp - 1] = tmp;
    }
  }
  for (let i = 0; i < nums.length; i++) {
    if (nums[i] - 1 !== i) return i + 1;
  }
  return nums[nums.length - 1] + 1;
}; 
```