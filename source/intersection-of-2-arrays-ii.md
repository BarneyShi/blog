---
title: Leetcode 350 - Intersection of 2 arrays II
date: 2021-10-14 17:42:03
tags:
- array
- hash table
---
**`Note:`**
- Use `map` to store frequencies, if it's bigger than 1, then it should be added into the result.

**`Question:`**

Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

**`Example:`**
```
Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [4,9]
Explanation: [9,4] is also accepted.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number[]}
 */
var intersect = function(nums1, nums2) {
  let map = new Map();
  let result = [];
  for (let e of nums1) {
    if (!map.has(e)) {
      map.set(e, 1);
    } else {
      map.set(e, map.get(e) + 1);
    }
  }
  for (let e of nums2) {
    if (map.has(e)) {
      map.set(e, map.get(e) - 1);
      if (map.get(e) >= 0) result.push(e);
    }
  }
  return result;
};
```