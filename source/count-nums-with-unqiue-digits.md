---
title: Leetcode 357 - Count nums with unqiue digits
date: 2021-12-07 21:15:52
tags:
- dfs
- dp
---
**`Note:`**
- `DP`
  - Made a mistake trying to use pure math. But it does involve some maths.
  - `dp[i]` means the `number of n-digit nums with unique digits`.
  - `dp[i]` are nums that has `one more digit` than `dp[i-1]`.
  - We cannot use those `0 - 9` that have been used before. How many left for us?
  - For `2-digit`, it's `9 * 9` (The first 9 is 0-9, then we can use 0 on the last digit, still 9 numbers)
  - For `3-digit`, it's `9 * 9 * 8`.
  - Based on permutation rules, `dp[i] = dp[i-1] * (11 - i)`.
  - Add `dp[0]` till `dp[n]`

**`Question:`**

Given an integer `n`, return the count of all numbers with unique digits, x, where `0 <= x < 10^n`.

**`Example:`**
```
Input: n = 2
Output: 91
Explanation: The answer should be the total numbers in the range of 0 ≤ x < 100, excluding 11,22,33,44,55,66,77,88,99
```

**`Code:`**

**`DP`**
```javascript
/**
 * @param {number} n
 * @return {number}
 */
var countNumbersWithUniqueDigits = function(n) {
  if (n === 0) return 1;
  if (n === 1) return 10;
  let dp = [...Array(n + 1).fill(0)];
  dp[0] = 1;
  dp[1] = 9;
  for (let i = 2; i <= n; i++) {
    dp[i] = dp[i - 1] * (11 - i);
  }
  let res = 0;
  for (const num of dp) {
    res += num;
  }
  return res;
};
```

**`DFS`**
```javascript
  if (n === 0) return 1;
  let used = [...Array(10).fill(false)];
  return dfs(n, 0) + 1;

  function dfs(n, index) {
    let count = 0;
    if (index >= n) return 0;
    for (let i = 0; i < 10; i++) {
      if ((i === 0 && index === 0) || used[i]) continue;
      used[i] = true;
      // Here, need to `add 1` which means the current `num` has already form a qualifed num. Like `n = 3`, but we've got `9`. Need to add 1.
      count += dfs(n, index + 1) + 1;
      used[i] = false;
    }
    return count;
  }
```