---
title: Leetcide 494 - Target sum
date: 2021-09-05 02:39:55
tags:
- leetcode
- dp
---
**`Note:`**
- This is also a `01 knapsack` problem.
- To get the bagWeight, think in this way: `bagWeight - (sum - bagWeight) = target`. We pick what's gonna be `+` into our bag.
- The DP formula is `DP[j] = DP[j] + DP[j - nums[i]]` based on two situations when we encounter `nums[i]`.
  - When we don't pick `nums[i]`, then it's still `DP[j]` as our last iteration.
  - When we pick `nums[i]`, then it's `DP[j - nums[i]]`.
- Initialize `DP[0]` as `1` because if it's `0`, then all our results would be `0`.

You are given an integer array nums and an integer target.

You want to build an expression out of nums by adding one of the symbols '+' and '-' before each integer in nums and then concatenate all the integers.

For example, if nums = [2, 1], you can add a '+' before 2 and a '-' before 1 and concatenate them to build the expression "+2-1".
Return the number of different expressions that you can build, which evaluates to target.

**Example:**
```
Input: nums = [1,1,1,1,1], target = 3
Output: 5
Explanation: There are 5 ways to assign symbols to make the sum of nums be target 3.
-1 + 1 + 1 + 1 + 1 = 3
+1 - 1 + 1 + 1 + 1 = 3
+1 + 1 - 1 + 1 + 1 = 3
+1 + 1 + 1 - 1 + 1 = 3
+1 + 1 + 1 + 1 - 1 = 3
```

```javascript
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var findTargetSumWays = function(nums, target) {
  const sum = nums.reduce((acc, cur) => acc + cur, 0);
  const bagWeight = (sum + target) / 2;
  if ((sum + target) % 2 !== 0 || (sum + target) < 0 || sum < target) return 0;
  let dp = [...Array(bagWeight + 1).fill(0)];
  dp[0] = 1;
  for (let i = 0; i < nums.length; i++) {
    for (let j = bagWeight; j >= nums[i]; j--) {
      dp[j] += dp[j - nums[i]];
    }
  }
  return dp[bagWeight];
};
```