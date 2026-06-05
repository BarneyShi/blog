---
title: Leetcode 464 - Can I Win
date: 2021-12-30 22:53:14
tags:
- dfs
- bitwise
---
**`Note:`**
- When to return `true`?
  - After choosing my num from `[1, max]` that has not been used. No matter what num next person chooses, he cannot win.
- Based on the constraints of this problem, it looks like solvable through `dfs`.
- There will be repetitive calculations, so we need `memo`.
- Use `Number`'s bit to memo instead of `[]`. Because all dfs will share a same `[]` and we don't want that. (Pass by reference).
- For i from `[1, max]`, use `(1 << i) & used` to check if number `x` has been used. If that bit is `1`, it's been used.
- Key part: `total <= i || !dfs(used | curr, total - i)`, it means either we `win now`, or `next player will never win`, then we can return `true`.

**`Question:`**

In the "100 game" two players take turns adding, to a running total, any integer from 1 to 10. The player who first causes the running total to `reach or exceed` 100 wins.

What if we change the game so that players `cannot` `re-use` integers?

For example, two players might take turns drawing from a common pool of numbers from 1 to 15 without replacement until they reach a total >= 100.

Given two integers `maxChoosableInteger` and `desiredTotal`, return true if the first player to move can force a win, otherwise, return false. Assume both players play optimally

**`Example:`**
```
Input: maxChoosableInteger = 10, desiredTotal = 11
Output: false
Explanation:
No matter which integer the first player choose, the first player will lose.
The first player can choose an integer from 1 up to 10.
If the first player choose 1, the second player can only choose integers from 2 up to 10.
The second player will win by choosing 10 and get a total = 11, which is >= desiredTotal.
Same with other integers chosen by the first player, the second player will always win.
```

**`Code:`**
```javascript
/**
 * @param {number} maxChoosableInteger
 * @param {number} desiredTotal
 * @return {boolean}
 */
 var canIWin = function(maxChoosableInteger, desiredTotal) {
  if (desiredTotal <= maxChoosableInteger) return true;
  // DesiredTotal is bigger than the sum of all possible nums.
  if ((1 + maxChoosableInteger) * maxChoosableInteger / 2 < desiredTotal) return false;
  let memo = {};
  return dfs(0, desiredTotal);

  function dfs(used, total) {
    if (memo[used] !== undefined) return memo[used];

    for (let i = 1; i <= maxChoosableInteger; i++) {
      const curr = 1 << i;
      // Note that & has a lower priority than ===.
      if ((curr & used) === 0) {
        if (total <= i || !dfs(used | curr, total - i)) return memo[used] = true;;
      }
    }
    return memo[used] = false;
  }
};
```