---
title: Leetcode 324 - Wiggle sort II
date: 2021-11-16 00:52:10
tags:
- sort
---
**`Note:`**
- It's not hard to come up with a way of `inserting alternatively`.
- Sort the whole nums first.
- Split it into half, and the `first half is longer` is len is odd. 
  - Explain: If the second one is longer, there will be a situation where the last of `second` has no where to go. Such as `[1,4,3,4,1,2,1,3,1,3,2,3,3]`, it will be like `[2, 4, 2, 4, 1, 3, 1, 3, 1, 3, 1, 3]` without the last element. We don't know where to put the last element `3`.

**`Question:`**

Given an integer array `nums`, reorder it such that `nums[0] < nums[1] > nums[2] < nums[3]....`

You may assume the input array always has a valid answer.

**`Example:`**
```
Input: nums = [1,5,1,1,6,4]
Output: [1,6,1,5,1,4]
Explanation: [1,4,1,5,1,6] is also accepted.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
 var wiggleSort = function(nums) {
  nums = nums.sort((a, b) => a - b);
  let first = nums.slice(0, Math.ceil(nums.length / 2)).reverse();
  let second = nums.slice(Math.ceil(nums.length / 2)).reverse();
  nums.forEach((e, i) => {
    if (i % 2 === 0) {
      const e = first.shift();
      nums[i] = e;
    } else {
      const e = second.shift();
      nums[i] = e;
    }
  })
};
```