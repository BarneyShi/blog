---
title: DP - Optimization 2D to 1D
date: 2021-09-06 00:38:09
tags:
- leetcode
- dp
---
How to optimize DP solutions from `2D` array to `1D`?. Take the most classic `01 knapsack` problem for example.
```
weights = [1, 3, 4]
values = [15, 20, 30]
bagWeight = 4  
```
1. When we are using `2D` array, the deduction is `dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - weight[i]] + value[i])`.
The state of `[i][...]` is only related to the state of `[i-1][...]`. Then, it's easy to realize that we can use `dp[j]` to represent our last iteration result, so we can save some spaces.
    - Our deduction becomes `dp[j] = max(dp[j], dp[j-weights[i]] + values[i])`. 
2. When we iterate through `j`, be careful to use `reversed` order on `j` to avoid repetitive calculations. 
    - For example, for `j = 1`, `dp[1] = max(dp[1], dp[1 - weight[0]] + values[0]) = 15`. (dp[] is initialized as `0`).
    - When `j = 2`, `dp[2] = max(dp[2], dp[2 - weight[0]] + values[0]) = 15 + 15 = 30`.
    - As you can see, we added `item 0` twice. 
    - We can avoid this by iterating `reversely` because then we can be sure that `dp[j - weight[i]]` are definitely `not calculated` yet, so we won't use it twice.