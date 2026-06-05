---
title: Leetcode 375 - Guess number higher or lower II
date: 2021-11-11 22:25:59
tags:
---
**`Note:`**
- To pick the `BEST among the WORST`.
- Not a `binary search` question, so we need to find out every possible move.
- DON'T define dfs as `(low, high, sum)`.
  - For example, when `low == 1, high == 3` and we pick `3`, the next iteration is `dfs(1, 2, 3)`.
  - What we will get is `min(3 + 1, 3 + 2)`. But apparently, `dfs = 1`.

**`Question:`**

We are playing the Guessing Game. The game will work as follows:

1.  I pick a number between `1` and `n`.
2.  You guess a number.
3.  If you guess the right number, you win the game.
4.  If you guess the wrong number, then I will tell you whether the number I picked is higher or lower, and you will continue guessing.
5.  Every time you guess a wrong number `x`, you will pay `x` dollars. If you run out of money, you lose the game.

Given a particular `n`, return the minimum amount of money you need to `guarantee a win regardless of what number I pick`.

**`Example:`**
![img](https://assets.leetcode.com/uploads/2020/09/10/graph.png)
```
Input: n = 10
Output: 16
Explanation: The winning strategy is as follows:
- The range is [1,10]. Guess 7.
    - If this is my number, your total is $0. Otherwise, you pay $7.
    - If my number is higher, the range is [8,10]. Guess 9.
        - If this is my number, your total is $7. Otherwise, you pay $9.
        - If my number is higher, it must be 10. Guess 10. Your total is $7 + $9 = $16.
        - If my number is lower, it must be 8. Guess 8. Your total is $7 + $9 = $16.
    - If my number is lower, the range is [1,6]. Guess 3.
        - If this is my number, your total is $7. Otherwise, you pay $3.
        - If my number is higher, the range is [4,6]. Guess 5.
            - If this is my number, your total is $7 + $3 = $10. Otherwise, you pay $5.
            - If my number is higher, it must be 6. Guess 6. Your total is $7 + $3 + $5 = $15.
            - If my number is lower, it must be 4. Guess 4. Your total is $7 + $3 + $5 = $15.
        - If my number is lower, the range is [1,2]. Guess 1.
            - If this is my number, your total is $7 + $3 = $10. Otherwise, you pay $1.
            - If my number is higher, it must be 2. Guess 2. Your total is $7 + $3 + $1 = $11.
The worst case in all these scenarios is that you pay $16. Hence, you only need $16 to guarantee a win.
```

**`Code:`**

**`DP O(n^3)`**
```javascript
/**
 * @param {number} n
 * @return {number}
 */
 var getMoneyAmount = function(n) {
  let dp = [...Array(n+2)].map(e => Array(n+2).fill(0));
  for (let i = n; i >= 1; i--) {
    for (let j = i; j <= n; j++) {
      // Must do this if we want to start from `n` and `i`.
      if (i === j) {
        dp[i][j] === 0;
        continue;
      }
      let res = Infinity;
      for (let k = i; k <= j; k++) {
        let cost = Math.max(k + dp[i][k-1], k + dp[k+1][j]);
        res = Math.min(cost, res);
      }
      dp[i][j] = res;
    }
  }
  return dp[1][n];
};
```

**`DFS memo`**
```javascript
/**
 * @param {number} n
 * @return {number}
 */
 var getMoneyAmount = function(n) {
   let memo = [...Array(n + 1)].map(e => Array(n + 1).fill(0));
  return dfs(1, n, 0);

  function dfs(low, high, sum) {
    if (memo[low][high] !== 0) {
      return memo[low][high]
    };
    if (low >= high) return 0;
    let res = Infinity;
    for (let i = low; i < high; i++) {
      // Do not do `dfs(low, high, sum)`.
      const lowGuess = i + dfs(low, i - 1);
      const highGuess = i + dfs(i + 1, high);
      res = Math.min(res, Math.max(lowGuess, highGuess));
    }
    memo[low][high] = res;
    return res;
  }
};
```