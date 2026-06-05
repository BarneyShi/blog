---
title: Leetcode 376 - Wiggle sub
date: 2021-10-04 17:01:50
tags:
- greedy
- dp
---
**`Note`**
- DP is easier IMO
  - `dp[i][0]` means a wiggle sub that ends with `nums[i]` and `nums[i] < nums[i-1]`
  - `dp[i][1]` means a wiggle sub that ends with `nums[i]` and `nums[i] > nums[i-1]`
  - The deduction is 
  ```javascript
      if (nums[i] > nums[j]) {
        dp[i][1] = Math.max(dp[i][1], dp[j][0] + 1);
      }
      if (nums[i] < nums[j]) {
        dp[i][0] = Math.max(dp[i][0], dp[j][1] + 1);
      }
  ```
- Greeedy is not easy to come up with
  - Take `[1,2,3,1]` for example, `1, 3, 1` are top and bottoms, so we only need to eliminate `2` on the way to the top. Same with eliminating `transition values` on the way to a bottom.
  - Which means that we only need to calculate how many `top` and `bottom` there are!

A `wiggle` sequence is a sequence where the differences between successive numbers strictly alternate between positive and negative. The first difference (if one exists) may be either positive or negative. A sequence with one element and a sequence with two non-equal elements are trivially wiggle sequences.

- For example, [1, 7, 4, 9, 2, 5] is a wiggle sequence because the differences (6, -3, 5, -7, 3) alternate between positive and negative.
- In contrast, [1, 4, 7, 2, 5] and [1, 7, 4, 5, 5] are not wiggle sequences. The first is not because its first two differences are positive, and the second is not because its last difference is zero.
A subsequence is obtained by deleting some elements (possibly zero) from the original sequence, leaving the remaining elements in their original order.

Given an integer array nums, return the length of the longest wiggle subsequence of nums.

**Example**
```
Input: nums = [1,17,5,10,13,15,10,5,16,8]
Output: 7
Explanation: There are several subsequences that achieve this length.
One is [1, 17, 10, 13, 10, 16, 8] with differences (16, -7, 3, -3, 6, -8).
```

**`Greedy`** O(n)
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var wiggleMaxLength = function(nums) {
  let curDiff = 0, prevDiff = 0, result = 1;
  for (let i = 1; i < nums.length; i++) {
    curDiff = nums[i] - nums[i-1];
    if (curDiff > 0 && prevDiff <= 0 || curDiff < 0 && prevDiff >= 0) {
      result++;
      prevDiff = curDiff;
    }
  }
  return result;
};
```

**`DP`** O(n^2)
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var wiggleMaxLength = function(nums) {
  let dp = [...Array(nums.length)].map (e => Array(2).fill(1));
  dp[0][0] = 1;
  dp[0][1] = 1;
  let result = 1;
  for (let i = 1; i < nums.length; i++) {
    for (let j = 0; j <= i; j++) {
      if (nums[i] > nums[j]) {
        dp[i][1] = Math.max(dp[i][1], dp[j][0] + 1);
      }
      if (nums[i] < nums[j]) {
        dp[i][0] = Math.max(dp[i][0], dp[j][1] + 1);
      }
      result = Math.max(result, dp[i][0], dp[i][1]);
    }
  }
  return result;
};
```