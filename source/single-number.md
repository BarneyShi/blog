---
title: Leetcode 136 - Single number
date: 2021-11-10 22:00:29
tags:
- bitwise
---
**`Note:`**
- Use `XOR` to find the extra.

**`Question:`**

Given a non-empty array of integers `nums`, every element appears twice except for one. Find that single one.

You must implement a solution with a linear runtime complexity and use only constant extra space.

**`Example:`**
```
Input: nums = [4,1,2,1,2]
Output: 4
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var singleNumber = function(nums) {
  let res = 0;
  for (const num of nums) {
    res ^= num;
  }
  return res;
};
```