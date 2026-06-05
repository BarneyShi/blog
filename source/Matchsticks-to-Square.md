---
title: Leetcode 473 - Matchsticks to Square
date: 2022-01-02 00:17:29
tags:
- dfs
- backtracking
---
**`Note:`**
- Based on the size of constraints, it's solvable through `backtracking`.
- Do we need to track `startIndex` here? 
  - `No` because after having form a side, we need to keep find more and have to preserve curr sides. So every time we need to iterate from `0`. (Just image when recursion is pretty deep and `startIndex` would be really big. If we do have `startIndex`, then we have no access to very front elements.)
- Edge case to trim unnecessary dfs: Side target is 18, and an element is 16, but every element is longer than 2.
- Use a `set` to track `index` that we've used.
- If we don't sort it first, then we might have really deep recursions if the front elements are really small. So we'd better put big element in the front.

**`Question:`**

You are given an integer array `matchsticks` where `matchsticks[i]` is the length of the `ith` matchstick. You want to use all the matchsticks to make one square. You should not break any stick, but you can link them up, and each matchstick must be used exactly one time.

Return `true` if you can make this square and `false` otherwise.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/04/09/matchsticks1-grid.jpg)
```
Input: matchsticks = [1,1,2,2,2]
Output: true
Explanation: You can form a square with length 2, one side of the square came two sticks with length 1.
```

**`Code:`**
```javascript
/**
 * @param {number[]} matchsticks
 * @return {boolean}
 */
 var makesquare = function(matchsticks) {
   matchsticks.sort((a, b) => b - a);
  const side = matchsticks.reduce((acc, cur) => acc + cur) / 4;
  if (side % 1 !== 0) return false;
  let min = Infinity;
  for (const s of matchsticks) {
    if (s > side) return false;
    if (s < min) min = s;
  }
  let used = new Set();
  return dfs(0, side);

  function dfs(currTotalLen, target) {
    if (currTotalLen === target * 4) {
      return true;
    }
    for (let i = 0; i < matchsticks.length; i++) {
      if (used.has(i)) continue;
      if (target - matchsticks[i] !== 0 && target - matchsticks[i] < min) return false;
      if ((currTotalLen % target) + matchsticks[i] > target) continue; 
      used.add(i);
      if (dfs(currTotalLen + matchsticks[i], target)) return true;
      used.delete(i);
    }
    return false;
  }
};
```