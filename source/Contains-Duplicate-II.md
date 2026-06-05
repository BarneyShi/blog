---
title: Leetcode 219 - Contains Duplicate II
date: 2022-01-18 15:40:57
tags:
- hash table
---
**`Note:`**
- Use hash table to store `[nums[i], [...indexes]]`;

**`Question:`**

Given an integer array nums and an integer k, return `true` if there are two distinct indices i and j in the array such that `nums[i] == nums[j]` and `abs(i - j) <= k`.

**`Example:`**
```
Input: nums = [1,2,3,1], k = 3
Output: true
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {boolean}
 */
var containsNearbyDuplicate = function(nums, k) {
  let map = new Map();
  for (let i = 0; i < nums.length; i++) {
    if (map.has(nums[i])) {
      for (const index of map.get(nums[i])) {
        if (Math.abs(index - i) <= k) return true;
        map.set(nums[i], [...map.get(nums[i]), i]);
      }
    } else {
      map.set(nums[i], [i]);
    }
  }
  return false;
};
```