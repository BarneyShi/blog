---
title: Leetcode 718 - Max length of repeated subarray
date: 2021-09-21 18:14:21
tags:
- leetcode
- dp
---
**`Note`**
- DP question, it's easier to understand it by drawing a table first. Take `nums1 = [1,2,3,2,8], nums2 = [5,6,1,4,7]` for example.
  - Use `dp[i][j]` to represent the max length of subarray that ends with `nums1[i]` and `nums2[j]` .
  - Initialize the `first row` and `first col` because we need `i-1` and `j-1` in our code.
  - When `nums1[i] === nums2[j]`, there are two situations
    -  `nums1[i-1] !== nums2[j-1]` so it's a new subarray. `dp[i][j] = 1` (need this because non first row/col is init as 0).
    - `nums1[i-1] === nums2[j-1]` so we just need to `add 1` to `dp[i-1][j-1]`.
  - ![img](https://i.imgur.com/kbAg6KR.png)
- Use `result` to store `max` while iterating.

Given two integer arrays nums1 and nums2, return the maximum length of a subarray that appears in both arrays.

**Example**
```
Input: nums1 = [1,2,3,2,1], nums2 = [3,2,1,4,7]
Output: 3
Explanation: The repeated subarray with maximum length is [3,2,1].
```

```javascript
/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number}
 */
var findLength = function(nums1, nums2) {
  let dp = [...Array(nums1.length)].map(e => Array(nums2.length).fill(0));
  let result = 0;
  for (let i = 0; i < nums1.length; i++) {
    dp[i][0] = nums1[i] === nums2[0] ? 1 : 0;
    dp[0][i] = nums2[i] === nums1[0] ? 1 : 0;
    if (result === 0 && dp[i][0] === 1 || dp[0][i] === 1) {
      result = 1;
    }
  }
  for (let i = 1; i < nums1.length; i++) {
    for (let j = 1; j < nums2.length; j++) {
      if (nums1[i-1] === nums2[j-1] && nums1[i] === nums2[j]) {
        dp[i][j] = dp[i-1][j-1] + 1;
        result = Math.max(result, dp[i][j]);
      } else if (nums1[i] === nums2[j]) {
        dp[i][j] = 1;
        result = Math.max(result, dp[i][j]);
      }
    }
  }
  return result;
};
```
