---
title: Leetcode 377 - Combination sum IV
date: 2021-09-07 16:45:25
tags:
- leetcode
- dp
---

**`Note:`**
- This is a `complete knapsack` problem.
- Iterate `j` first because we care about the orders of elements. `{1,2}` and `{2, 1}` are two different arrays.
- Iterate `i` and `j` in `ascending` order because we can add an element `multi` times.

Given an array of distinct integers nums and a target integer target, return the number of possible combinations that add up to target.

The answer is guaranteed to fit in a 32-bit integer.

**Example:**
```
Input: nums = [1,2,3], target = 4
Output: 7
Explanation:
The possible combination ways are:
(1, 1, 1, 1)
(1, 1, 2)
(1, 2, 1)
(1, 3)
(2, 1, 1)
(2, 2)
(3, 1)
Note that different sequences are counted as different combinations.
```

```javascript
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var combinationSum4 = function(nums, target) {
  let dp = [...Array(target + 1).fill(0)];
  dp[0] = 1;
  for (let j = 0; j <= target; j++ ) {
    for (let i = 0; i < nums.length; i++) {
      if (j >= nums[i]) {
        dp[j] += dp[j-nums[i]];
      }
    }
  }
  return dp[target];
};
```
