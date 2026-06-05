---
title: Leetcode 279 - Perfect squares
date: 2021-09-17 18:51:43
tags:
- leetcode
- dp
---
**`Note`**
- DP question.
- Use math to create a `nums` array whose length is `Math.ceil(sqrt(n))`.
- The deduction is `dp[j] = Math.min(dp[j], dp[j - nums[i]] + 1)`.
- Similar to coin change question, we need to initialize dp elements as `Infinity`.
- Initialize DP[0] = 0 after doing a experiment.

Given an integer n, return the least number of perfect square numbers that sum to n.

A perfect square is an integer that is the square of an integer; in other words, it is the product of some integer with itself. For example, 1, 4, 9, and 16 are perfect squares while 3 and 11 are not.

**Example**
```
Input: n = 12
Output: 3
Explanation: 12 = 4 + 4 + 4.
```

```javascript
/**
 * @param {number} n
 * @return {number}
 */
var numSquares = function(n) {
  const sqrt = Math.ceil(Math.sqrt(n));
  let nums = [...Array(sqrt+1)].map((e, index) => (index**2));
  let dp = [...Array(n+1).fill(Infinity)];
  dp[0] = 0;
  for (let i = 1; i < nums.length; i++) {
    for (let j = nums[i]; j <= n; j++) {
      dp[j] = Math.min(dp[j], dp[j - nums[i]] + 1);
    }
  }
  return dp[n];
};
```