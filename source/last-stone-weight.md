---
title: Leetcode 1049 - Last stone weight II
date: 2021-09-04 18:52:14
tags:
- leetcode
- dp
---
You are given an array of integers stones where stones[i] is the weight of the ith stone.

We are playing a game with the stones. On each turn, we choose any two stones and smash them together. Suppose the stones have weights x and y with x <= y. The result of this smash is:

- If x == y, both stones are destroyed, and
- If x != y, the stone of weight x is destroyed, and the stone of weight y has new weight y - x.
At the end of the game, there is at most one stone left.

Return the smallest possible weight of the left stone. If there are no stones left, return 0.

**Example:**
```
Input: stones = [2,7,4,1,8,1]
Output: 1
Explanation:
We can combine 2 and 4 to get 2, so the array converts to [2,7,1,8,1] then,
we can combine 7 and 8 to get 1, so the array converts to [2,1,1,1] then,
we can combine 2 and 1 to get 1, so the array converts to [1,1,1] then,
we can combine 1 and 1 to get 0, so the array converts to [1], then that's the optimal value.
```

**`Note:`** 
- This is a `01 knapsack` problem. 
  - The capacity of our bag is `half` of the total weight. 
  - 
- The DP formula is `DP[j] = max(DP[j], DP[j - stones[i]] + stones[i])`.
- Iterate stones first, then the bag.
- The inner loop must be in `descending` order.

```javascript
/**
 * @param {number[]} stones
 * @return {number}
 */
var lastStoneWeightII = function(stones) {
  let sum = stones.reduce((acc, cur) => acc + cur, 0);
  let target = Math.floor(sum/2);
  let dp = [...Array(target + 1).fill(0)];
  
  for (let i = 0; i < stones.length; i++) {
    for (let j = target; j >= stones[i]; j--) {
      dp[j] = Math.max(dp[j], dp[j - stones[i]] + stones[i]);
    }
  }
  // dp[target] is the biggest value of stones whose total value is smaller or equal to sum/2.
  // We can be sure that the rest half is also smallre or equal to dp[target]. We substract dp//// [target]*2 and get the rest stones that won't be destroyed. 
  return sum - dp[target]*2;
};
```