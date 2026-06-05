---
title: Leetcode 486 - Predict the Winner
date: 2022-01-03 21:11:43
tags:
---
**`Note:`**
- Both players play `optimally`, then when should we return `true`?
  - When we're sure no matter which end `2` chooses, it always returns `false`.
- Use `canChoose` to denote whether it's `1`'s turn.

**`Question:`**

You are given an integer array `nums`. Two players are playing a game with this array: player 1 and player 2.

Player 1 and player 2 take turns, with player 1 starting first. Both players start the game with a score of `0`. At each turn, the player takes one of the numbers from either end of the array (i.e., `nums[0]` or `nums[nums.length - 1]`) which reduces the size of the array by `1`. The player adds the chosen number to their score. The game ends when there are no more elements in the array.

Return `true` if Player 1 can win the game. If the scores of both players are equal, then player 1 is still the winner, and you should also return `true`. You may assume that both players are playing optimally.

**`Example:`**
```
Input: nums = [1,5,2]
Output: false
Explanation: Initially, player 1 can choose between 1 and 2. 
If he chooses 2 (or 1), then player 2 can choose from 1 (or 2) and 5. If player 2 chooses 5, then player 1 will be left with 1 (or 2). 
So, final score of player 1 is 1 + 2 = 3, and player 2 is 5. 
Hence, player 1 will never be the winner and you need to return false.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {boolean}
 */
 var PredictTheWinner = function(nums) {
  return dfs(0, nums.length - 1, 0, 0, true);
  function dfs(start, end, score1, score2, canChoose) {
    if (start > end) {
      return score1 >= score2;
    }
    if (canChoose) {
      canChoose = !canChoose;
      // As long as there is 1 way to win.
      if (dfs(start + 1, end, score1 + nums[start], score2, canChoose) || dfs(start, end - 1, score1 + nums[end], score2, canChoose)) {
        return true;
      }
    } else {
      canChoose = !canChoose;
      // Only if 2 has no chance.
      if (dfs(start + 1, end, score1, score2 + nums[start], canChoose) && dfs(start, end - 1, score1, score2 + nums[end], canChoose)) {
        return true;
      }
    }
    return false;
  }
};
```