---
title: Leetcode 474 - Ones and zeroes
date: 2021-09-05 22:41:29
tags:
- leetcode
- dp
---
You are given an array of binary strings strs and two integers m and n.

Return the size of the largest subset of strs such that there are at most m 0's and n 1's in the subset.

A set x is a subset of a set y if all elements of x are also elements of y.

**Example:**
```
Input: strs = ["10","0001","111001","1","0"], m = 5, n = 3
Output: 4
Explanation: The largest subset with at most 5 0's and 3 1's is {"10", "0001", "1", "0"}, so the answer is 4.
Other valid but smaller subsets include {"0001", "1"} and {"10", "1", "0"}.
{"111001"} is an invalid subset because it contains 4 1's, greater than the maximum of 3.
```
```
Input: strs = ["10","0","1"], m = 1, n = 1
Output: 2
Explanation: The largest subset is {"0", "1"}, so the answer is 2.
```

**`Note:`** 
- This is a `01 knapsack` problem.
- Just like optimizing `2D` dp array to `1D`. This should be a `3D` dp array if we do it in a traditional way, but we can simplify the space! Imagine it was `dp[i][j][k] = max(dp[i-1][j][k], dp[i-1][j-zeroes][k-ones] + 1)`, we can simplify it as `dp[j][k] = max(dp[j][k], dp[j-zeroes][k-ones] + 1)`. 
- Please remember to iterate `j` and `k` in `reversed` order just like what we did in other DP problems.

```javascript
/**
 * @param {string[]} strs
 * @param {number} m
 * @param {number} n
 * @return {number}
 */
var findMaxForm = function(strs, m, n) {
  let dp = [...Array(m + 1)].map(e => Array(n + 1).fill(0));
  for (let str of strs) {
    const [zeroes, ones] = calculateZeroAndOne(str);
    for (let i = m; i >= zeroes; i--) {
      for (let j = n; j >= ones; j--) {
        dp[i][j] = Math.max(dp[i][j], dp[i - zeroes][j - ones] + 1);
      }
    }
  }
  return dp[m][n];
};

function calculateZeroAndOne(str) {
  let ans = [0, 0];
  for (let i = 0; i < str.length; i++) {
    if (str[i] === '0') {
      ans[0] += 1;
    } else {
      ans[1] +=1;
    }
  }
  return ans;
}
```