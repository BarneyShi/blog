---
title: DP - 1D knapsack Optimization
date: 2021-09-04 02:56:13
tags:
- dp
---
**Note:**

We can optimize what we got from using a 2D array.
- Keyword: `No Aftereffect`: It means the `future` only cares about the `current state` but not the `history`. 
- In this problem, it means that `DP[j]` only depends on `DP[j - 1]`. 
- In `DP[i][j] = max(DP[i-1][j], DP[i-1][j-weight[i] + value[i])`, we can see the state of `DP[i]` is only related to `DP[i-1]`. Here, `DP[j]` represents our result from last iteration, and it contains info about `i - 1`. Hence we can use `DP[j]` only as a 1D array.

- When we don't care about the `order` of elements:
  1. We have to iterate `item` first then `bag`. (So for arr[1,2..], we can be sure [2,1] won't happen in any result.)
  2. We have to iterate `bag` from the `end` to the `start`.
- When we care about the order of elements:
  1. Iterate `j` first then `i`.

```javascript
function 1DKnapsack(weight, value, bagWeight) {
  let dp = [...Array(weight.length + 1).fill(0)];

  for (let i = 0; i < weight.length; i++) {
    for (let j = bagWeight; j >=weight[i]; j-- ) {
      dp[j] = Math.max(dp[j], dp[j - weight[i]] + value[i]);
    }
  }

  return dp[bagWeight];
}
```
