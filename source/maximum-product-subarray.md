---
title: Leetcode 152 - Maximum product subarray
date: 2021-11-14 02:55:33
tags:
- dp
---
**`Note:`**
- Use `normal` memory will cause TLE because the array can get really big.
- The tricky thing about `product` is that if `dp[i-1]` is really negative and really small, but `nums[i] < 0`. It might even be the `max` that we want.
- So, we not only need to record `max from 0 to i - 1`, but also `min`!!
- Define `dp[i][0]` as the `MIN product` ending with `nums[i]`.
- `dp[i][1]` as the `MAX product` ending with `nums[i]`.
- It's also easy to get:
  - `dp[i][0] = Math.min(nums[i], dp[i - 1][0]*nums[i], dp[i - 1][1]*nums[i])`.
  - `dp[i][1] = Math.max(nums[i], dp[i - 1][0]*nums[i], dp[i - 1][1]*nums[i])`.

**`Question:`**

Given an integer array `nums`, find a contiguous non-empty subarray within the array that has the largest product, and return the product.

It is `guaranteed` that the answer will fit in a 32-bit integer.

A `subarray` is a contiguous subsequence of the array.

**`Example:`**
```
Input: nums = [2,3,-2,4]
Output: 6
Explanation: [2,3] has the largest product 6.
```

**`Code:`**
**`DP O(n)`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var maxProduct = function(nums) {
  let dp = [...Array(nums.length)].map(e => Array(2).fill(1));
  dp[0][0] = nums[0];
  dp[0][1] = nums[0];
  for (let i = 1; i < nums.length; i++) {
    dp[i][0] = Math.min(nums[i], dp[i - 1][0]*nums[i], dp[i - 1][1]*nums[i]);
    dp[i][1] = Math.max(nums[i], dp[i - 1][0]*nums[i], dp[i - 1][1]*nums[i]);
  }
  let res = -Infinity;
  for (let j = 0; j < nums.length; j++) {
    res = Math.max(res, dp[j][1]);
  }
  return res;
};
```

**`Brute Force - Heap out of memory when nums is too long`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var maxProduct = function(nums) {
  let dp = [...Array(nums.length)].map(e => Array(nums.length).fill(1));
  for (let i = 0; i < nums.length; i++) {
    for (let j = 0; j <= i; j++) {
      if (i === j) dp[i][j] = nums[i];
    }
  }
  let res = -Infinity;
  for (let i = nums.length - 1; i >= 0; i--) {
    for (let j = i; j < nums.length; j++) {
      if (i === j) {
        res = Math.max(res, dp[i][j]);
        continue;
      }
      if (i + 1 > j - 1) continue;
      dp[i][j] = nums[i]*dp[i+1][j-1]*nums[j];
      res = Math.max(res, dp[i][j]);
    }
  }
  return res;
};
```