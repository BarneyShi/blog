---
title: Leetcode 268 - Missing num
date: 2021-11-05 14:51:29
tags:
---
**`Note:`**
- To finish in O(1) space complexity.
- Calculate the sum first, then substract each num from it.

**`Question:`**

Given an array `nums` containing `n` distinct numbers in the range `[0, n]`, return the only number in the range that is missing from the array.

**`Example:`**
```
Input: nums = [3,0,1]
Output: 2
Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var missingNumber = function(nums) {
  const len = nums.length;
  let sum = len * (len + 1) / 2;
  for (const num of nums) {
    sum -= num;
  }
  return sum;
};
```