---
title: Leetcode 397 - Integer repalcement
date: 2021-11-18 15:56:38
tags:
- dfs
- memorization
---
**`Note:`**
- A really typical `DFS + Memo` problem.

**`Question:`**

Given a positive integer `n`, you can apply one of the following operations:

- If `n` is `even`, replace n with `n / 2`.
- If `n` is `odd`, replace n with either `n + 1` or `n - 1`.

Return the minimum number of operations needed for `n` to become `1`.

**`Example:`**
```
Input: n = 8
Output: 3
Explanation: 8 -> 4 -> 2 -> 1
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @return {number}
 */
var integerReplacement = function(n) {
  let memo = {};
  return dfs(n);

  function dfs(num) {
    if (memo[num]) return memo[num];
    if (num === 1) return 0;
    if (num % 2 === 1) {
      const add1 = 1 + dfs(num + 1);
      const minus1 = 1 + dfs(num - 1);
      memo[num] = Math.min(add1, minus1);
    } else {
      const divide = 1 + dfs(num / 2);
      memo[num] = divide;
    }
    return memo[num];
  }
};
```