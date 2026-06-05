---
title: Leetcode 413 - Arithmetic Slices
date: 2021-12-17 03:21:57
tags:
- dp
---
**`Note:`**
- Subarray/subsequence problems are usually dp.
- `dp[i]` means the `longest` arithmetic progression ending with nums[i].
- When `nums[i-2], nums[i-1], nums[i]` forms an arithmetic array, `dp[i] = dp[i-1] + 1`.
- If not, `dp[i] = 2`, and we add `dp[i-1]` to the ans[] to calculate the last `longest length` of arithmetic array.
- Finally, use math `(n - 3 + 1)*(n - 3 + 2) / 2` to calculate the num of subarrays when the arithmetic array's length is `n`.

**`Question:`**

An integer array is called `arithmetic` if it consists of at least `three` elements and if the difference between any two consecutive elements is the same.

For example, [1,3,5,7,9], [7,7,7,7], and [3,-1,-5,-9] are arithmetic sequences.
Given an integer array `nums`, return the `number` of arithmetic subarrays of nums.

A subarray is a contiguous subsequence of the array.

**`Example:`**
```
Input: nums = [1,2,3,4]
Output: 3
Explanation: We have 3 arithmetic slices in nums: [1, 2, 3], [2, 3, 4] and [1,2,3,4] itself.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var numberOfArithmeticSlices = function(nums) {
  let arithmetics = [];
  let dp = [...new Array(nums.length).fill(1)]
  dp[1] = 2;
  for (let i = 2; i < nums.length; i++) {
    if (nums[i] - nums[i - 1] === nums[i - 1] - nums[i - 2]) {
      dp[i] = dp[i - 1] + 1;
    } else {
      dp[i] = 2;
      if (dp[i - 1] > 2) arithmetics.push(dp[i - 1]);
    }
    if (i === nums.length - 1 && dp[i] > 2) arithmetics.push(dp[i]);
  }
  return arithmetics.reduce((acc, cur) => {
    return acc += (cur - 3 + 2)*(cur - 3 + 1) / 2 
  }, 0)
};
```