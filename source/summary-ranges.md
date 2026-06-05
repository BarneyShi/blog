---
title: Leetcode 228 - Summary ranges
date: 2021-11-05 00:04:59
tags:
---
**`Note:`**
- Two while loops. 
- One to iterate to the end.
- One to iterate until `nums[i+1] !== nums[i] + 1`.

**`Question:`**

You are given a sorted unique integer array `nums`.

Return the smallest sorted list of ranges that cover all the numbers in the array exactly. That is, each element of nums is covered by exactly one of the ranges, and there is no integer x such that x is in one of the ranges but not in nums.

Each range [a,b] in the list should be output as:

- `"a->b"` if `a != b`
- `"a"` if `a == b`

**`Example:`**
```
Input: nums = [0,1,2,4,5,7]
Output: ["0->2","4->5","7"]
Explanation: The ranges are:
[0,2] --> "0->2"
[4,5] --> "4->5"
[7,7] --> "7"
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {string[]}
 */
var summaryRanges = function(nums) {
  let res = [];
  let i = 0;
  while (i < nums.length) {
    let left = nums[i];
    while (i < nums.length - 1 && nums[i + 1] === nums[i] + 1) {
      i++;
    }
    if (nums[i] !== left) {
      res.push(left + '->' + nums[i]);
      i++;
    } else {
      res.push(left + '');
      i++;
    }
  }
  return res;
};
```