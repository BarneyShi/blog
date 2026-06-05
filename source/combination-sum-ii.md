---
title: Leetcode 40 - Combination sum II
date: 2021-09-10 17:59:56
tags:
- dfs
- backtracking
---
**`Note:`**
- This is a backtracking problem
- The key is to remove repetitive elements that have appeared on the `same level`
  - Check `i > startIndex` because the leftmost node on each level can have the same value as its parent.
  - For example `[1, 1, 2]`. To avoid `[1,2]` appearing twice, we have to check if `candidates[i] == candidates[i-1]` in the for loop.
- Rememebr to `sort` candidates first before iterating, so elements with same value will be neighbors. 
- ![img](https://i.imgur.com/2ISIfXk.png)

Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.

Each number in candidates may only be used once in the combination.

Note: The solution set must not contain duplicate combinations.

**Example**
```
Input: candidates = [10,1,2,7,6,1,5], target = 8
Output: 
[
[1,1,6],
[1,2,5],
[1,7],
[2,6]
]
```

```javascript
/**
 * @param {number[]} candidates
 * @param {number} target
 * @return {number[][]}
 */
var combinationSum2 = function(candidates, target) {
  let ans = [];
  let path = [];
  candidates.sort((a,b) => (a - b));
  backtracking(0, target, 0, candidates);
  return ans;
  
  function backtracking(curSum, targetSum, startIndex, candidates) {
    if (curSum > targetSum) return;
    if (curSum === targetSum) {
      ans.push([...path]);
      return;
    }
    for (let i = startIndex; i < candidates.length; i++) {
      if (i > startIndex && candidates[i] == candidates[i-1]) continue;
      path.push(candidates[i]);
      curSum += candidates[i];
      backtracking(curSum, targetSum, i+1, candidates);
      path.pop();
      curSum -= candidates[i];
    }
  }
};
```
