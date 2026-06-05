---
title: Leetcode 414 - 3rd max num
date: 2021-11-14 00:27:29
tags:
- array
---
**`Note:`**
- To finish in one iteration, just use 3 variables to track `max, second, third`.
- If `third` is still `-Infinity`, it means there are not `3 distinct nums`, so return `max` instead.

**`Question:`**

Given an integer array `nums`, return the third distinct maximum number in this array. If the third maximum does not exist, return the maximum number.

**`Example:`**
```
Input: nums = [3,2,1]
Output: 1
Explanation:
The first distinct maximum is 3.
The second distinct maximum is 2.
The third distinct maximum is 1.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var thirdMax = function(nums) {
  if (nums.length <= 2) return Math.max(...nums);
  let biggest = -Infinity, second = -Infinity, third = -Infinity;
  for (const num of nums) {
    if (num > biggest) {
      third = second;
      second = biggest;
      biggest = num;
    } else if (num > second && num < biggest) {
      third = second;
      second = num;
    } else if (num > third && num < second) {
      third = num;
    }
  }
  // Check this
  return third !== -Infinity ? third : biggest;
};
```