---
title: Leetcode 303 - Range sum query - Immutable
date: 2021-11-08 23:57:53
tags:
---
**`Note:`**
- Lots of calls will be made, it's not clever to calculate each call.
- Make an array for `sum[0, i]`
- Do deduction betwen `arr[right] - arr[left - 1]`.
- Make `arr[left - 1] === 0` when `left - 1 < 0`.

**`Question:`**

Given an integer array `nums`, handle multiple queries of the following type:

- Calculate the sum of the elements of `nums` between indices `left` and `right` inclusive where `left <= right`.

Implement the `NumArray` class:

- `NumArray(int[] nums)` Initializes the object with the integer array nums.
- `int sumRange(int left, int right)` Returns the sum of the elements of nums between indices left and right inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right]).

**`Example:`**
```
Input
["NumArray", "sumRange", "sumRange", "sumRange"]
[[[-2, 0, 3, -5, 2, -1]], [0, 2], [2, 5], [0, 5]]
Output
[null, 1, -1, -3]

Explanation
NumArray numArray = new NumArray([-2, 0, 3, -5, 2, -1]);
numArray.sumRange(0, 2); // return (-2) + 0 + 3 = 1
numArray.sumRange(2, 5); // return 3 + (-5) + 2 + (-1) = -1
numArray.sumRange(0, 5); // return (-2) + 0 + 3 + (-5) + 2 + (-1) = -3
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 */
var NumArray = function(nums) {
  const array = [...Array(nums.length).fill(0)];
  for (let i = 0; i < array.length; i++) {
    if (i === 0) {
      array[i] = nums[i];
    } else {
      array[i] = array[i - 1] + nums[i];
    }
  }
  this.array = array;
};

/** 
 * @param {number} left 
 * @param {number} right
 * @return {number}
 */
NumArray.prototype.sumRange = function(left, right) {
  const array = this.array;
  return array[right] - (left - 1 < 0 ? 0 : array[left - 1]);
};

/**
 * Your NumArray object will be instantiated and called as such:
 * var obj = new NumArray(nums)
 * var param_1 = obj.sumRange(left,right)
 */
```