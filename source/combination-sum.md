---
title: Leetcode 39 - Combination sum
date: 2021-09-09 15:00:05
tags:
- dfs
- backtracking
---
**`Note:`**
- This is a `backtracking` problem.
- The key is to make every element get `added multi times`.
- We still need `startIndex` because we need it to know where we should start our forloop. If we just use `0` for start point, there will be duplicates. Like `[2,5,3]` vs `[5,2,3]`.

Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.

The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

It is guaranteed that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

**`Example`**
![img](https://img-blog.csdnimg.cn/20201223170730367.png)
```
Input: candidates = [2,3,6,7], target = 7
Output: [[2,2,3],[7]]
Explanation:
2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
7 is a candidate, and 7 = 7.
These are the only two combinations.
```

```javascript
/**
 * @param {number[]} candidates
 * @param {number} target
 * @return {number[][]}
 */
var combinationSum = function(candidates, target) {
  let res = [];
  let path = [];
  backtracking(0, 0);
  return res;
  
  function backtracking(startIndex, sum) {
    if (sum > target || startIndex >= candidates.length) {
      return;
    }
    if (sum === target) {
      res.push([...path]);
      return;
    }
    for (let i = startIndex; i < candidates.length; i++) {
      path.push(candidates[i]);
      backtracking(i, sum + candidates[i]);
      path.pop();
    }
  }
};
```