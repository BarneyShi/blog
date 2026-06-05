---
title: Leetcode 349 - Intersection of 2 arrays
date: 2021-10-14 17:03:22
tags:
- array
- hash table
---
**`Note:`**
- At first, I thought we are looking for an intersection that has to be the same order in both arrays. But it's not that hard in fact.
- This is more like finding elements that have appeared in both arrays.

**`Question:`**

Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must be unique and you may return the result in any order.

**`Example:`**
```
Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2]
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number[]}
 */
var intersection = function(nums1, nums2) {
  const map = new Map();
  let result = [];
  for (let e of nums1) {
    if (!map.has(e)) {
      map.set(e, true);
    }
  }
  for (let e of nums2) {
    if (map.has(e) && map.get(e)) {
      result.push(e);
      map.set(e, false);
    }
  }
  return result;
};
```