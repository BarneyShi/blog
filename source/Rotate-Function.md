---
title: Leetcode 396 - Rotate Function
date: 2021-12-14 01:31:57
tags:
- dp
---
**`Note:`**
- By the example, it feels like there might be some relations between each state.
- Bingo! It's a DP question.
- I soon found that by adding `sum` into each state and just `subtract` `length * endNum` from it, we can get the new `dp[i]`.
- `dp[i] = dp[i - 1] + sum - length * sum`.

**`Question:`**

You are given an integer array `nums` of length `n`.

Assume `arrk` to be an array obtained by rotating `nums` by `k` positions clock-wise. We define the rotation function `F` on `nums` as follow:

- `F(k) = 0 * arrk[0] + 1 * arrk[1] + ... + (n - 1) * arrk[n - 1].`
Return the maximum value of `F(0), F(1), ..., F(n-1)`.

The test cases are generated so that the answer fits in a `32`-bit integer.

**`Example:`**
```
Input: nums = [4,3,2,6]
Output: 26
Explanation:
F(0) = (0 * 4) + (1 * 3) + (2 * 2) + (3 * 6) = 0 + 3 + 4 + 18 = 25
F(1) = (0 * 6) + (1 * 4) + (2 * 3) + (3 * 2) = 0 + 4 + 6 + 6 = 16
F(2) = (0 * 2) + (1 * 6) + (2 * 4) + (3 * 3) = 0 + 6 + 8 + 9 = 23
F(3) = (0 * 3) + (1 * 2) + (2 * 6) + (3 * 4) = 0 + 2 + 12 + 12 = 26
So the maximum value of F(0), F(1), F(2), F(3) is F(3) = 26.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var maxRotateFunction = function(nums) {
  const sum = nums.reduce((acc, cur) => acc + cur);
  let dp = [...Array(nums.length).fill(0)];
  dp[0] = nums.reduce((acc, cur, i) => acc + cur * i, 0);
  let max = dp[0];
  let end = nums[nums.length - 1];
  const length = nums.length;
  for (let i = 1; i < nums.length; i++) {
    dp[i] = dp[i - 1] + sum - length * end;
    end = nums[length - i - 1];
    max = Math.max(max, dp[i]);
  }
  return max;
};
```