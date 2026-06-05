---
title: Leetcode 628 - Maximum Product of Three Numbers
date: 2021-12-10 22:39:09
tags:
- sort
---
**`Note:`**
- Not a really easy question.
- Four situations:
  - When all nums are non-negative, `max = product of the biggest three ints`.
  - When all nums are non-positive, `max = product of the smallest three ints`.
  - When there are both negative and positive nums:
    - `max = two smallest nums * the biggest num`.
    - `max = the smallest num * two biggest nums`.
- Pick the biggest res among these.

**`Question:`**

Given an integer array `nums`, find `three` numbers whose product is `maximum` and return the maximum product.

**`Example:`**
```
Input: nums = [1,2,3]
Output: 6
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var maximumProduct = function(nums) {
  nums.sort((a, b) => a - b);
  const length = nums.length;
  return Math.max(nums[0] * nums[1] * nums[2], nums[length - 1] * nums[length - 2] * nums[length - 3], nums[0] * nums[1] * nums[length - 1], nums[length - 1] * nums[length - 2] * nums[0]);
};
```