---
title: Leetcode 334 - Increasing triplet subsequence
date: 2021-11-02 02:52:34
tags:
- greedy
---
**`Note:`**
- Brute force will lead to TLE.
- Use `small` and `mid` to store the min and a slightly bigger (not max) we've met.
- If `cur > mid`, return `true.
- If `cur <= small`, `small = cur`.
- If `cur <= mid`, `mid = cur`.

**`Question:`**

Given an integer array nums, return true if there exists a triple of indices `(i, j, k)` such that `i < j < k` and `nums[i] < nums[j] < nums[k]`. If no such indices exists, return false.

**`Example:`**
```
[20,100,10,12,5,13]
True, [10, 12, 13]
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {boolean}
 */
var increasingTriplet = function(nums) {
  let small = Infinity, mid = Infinity;
  for (let i = 0; i < nums.length; i++) {
    const cur = nums[i];
    if (cur <= small) {
      small = cur;
    } else if (cur <= mid) {
      mid = cur;
    } else {
      return true;
    }
  }
  return false;
};
```