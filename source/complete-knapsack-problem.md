---
title: DP - Complete knapsack problem
date: 2021-09-06 21:41:15
tags:
- leetcode
- dp
---
```
weight = [1, 3, 4];
value = [15, 20, 30];
bagWeight= 4;
There are unlimited numbre of each item. What's the largest total value you can get?
```
**`Note:`**
- It doesn't matter you iterate `i (item)` or `j (bag)` first.
- The inner loop `doesn't` need to be in `reversed` order because you can add an item multi times.
- If you `don't care about the order` of elements in results, iterate `i` first.
  - Explaination: When we iterate `i` first, there won't be situations where `{1, 5}` and `{5, 1}` are considered two different results because the order of `i` is fixed now.

```javascript
function completeKnapSack(weight, value, bagWeight) {
  let dp = [...Array(bagWeight + 1).fill(0)];
  for (let i = 0; i < weight.length; i++) {
    for (let j = weight[i]; j <= bagWeight; j++) {
      dp[j] = Math.max(dp[j], dp[j-weight[i]] + value[i]);
    }
  }
  return dp[bagWeight];
}
```

