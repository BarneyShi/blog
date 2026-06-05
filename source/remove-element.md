---
title: Leetcode 27 - Remove element
date: 2021-08-27 01:48:55
tags:
- leetcode
- easy
- array
---
Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The relative order of the elements may be changed.
Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.

**Note:** The memory address of `array` is consecutive. So we have to splice the neighbors of deleted elements. It's different from linked list.

**Example 1:**
```
Input: nums = [3,2,2,3], val = 3
Output: 2, nums = [2,2,_,_]
Explanation: Your function should return k = 2, with the first two elements of nums being 2.
It does not matter what you leave beyond the returned k (hence they are underscores).
```
![img](https://tva1.sinaimg.cn/large/008eGmZEly1gntrds6r59g30du09mnpd.gif)
```javascript
/**
 * @param {number[]} nums
 * @param {number} val
 * @return {number}
 */
var removeElement = function(nums, val) {
  let fastIndex = 0;
  let slowIndex = 0;
  while (fastIndex < nums.length) {
    while (nums[fastIndex] === val) {
      fastIndex++;
    }
    if (fastIndex >= nums.length) {
      return slowIndex;
    }
    nums[slowIndex] = nums[fastIndex];
    slowIndex++;
    fastIndex++;
  }
  return slowIndex;
};
```