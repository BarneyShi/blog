---
title: Leetcode 697 - Degree of an Array
date: 2021-12-22 02:02:09
tags:
- hash table
---
**`Note:`**
- First iteration to get `max` frequency and every `n`'s indexes.
- For n whose `indexes === max`, use `val[len - 1] - val[0] + 1` to get the length, and find the `min` length.

**`Question:`**

Given a non-empty array of non-negative integers `nums`, the degree of this array is defined as the maximum frequency of any one of its elements.

Your task is to find the smallest possible length of a (contiguous) subarray of `nums`, that has the same degree as `nums`.

**`Example:`**
```
Input: nums = [1,2,2,3,1]
Output: 2
Explanation: 
The input array has a degree of 2 because both elements 1 and 2 appear twice.
Of the subarrays that have the same degree:
[1, 2, 2, 3, 1], [1, 2, 2, 3], [2, 2, 3, 1], [1, 2, 2], [2, 2, 3], [2, 2]
The shortest length is 2. So return 2.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var findShortestSubArray = function(nums) {
  let map = new Map();
  let max = 0;
  for (const [i, n] of nums.entries()) {
    if (!map.has(n)) {
      map.set(n, [i]);
      if (max === 0) max = 1;
    } else {
      map.set(n, [...map.get(n), i]);
      if (map.get(n).length > max) max = map.get(n).length;
    }
  }
  let ans = Infinity;
  for (const [key, val] of map) {
    if (val.length >= max && val[val.length - 1] - val[0] + 1 < ans) {
      max = val.length;
      ans = val[val.length - 1] - val[0] + 1;
    }
  }
  return ans;
};
```