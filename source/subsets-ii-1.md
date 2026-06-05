---
title: Leetcode 90 - Subsets II
date: 2021-11-25 02:05:58
tags:
---
**`Note:`**
- Not only do we need to add the path when `index === nums.length`. Every node in the tree is a potential candidate. So, we need to add them all.
- Use `Set[]` to avoid duplicates. 

**`Question:`**

Given an integer array `nums` that may contain duplicates, return all possible subsets (the power set).

The solution set `must not` contain duplicate subsets. Return the solution in `any order`.

**`Example:`**
```
Input: nums = [1,2,2]
Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number[][]}
 */
 var subsetsWithDup = function(nums) {
  nums.sort((a, b) => a - b);
  let res = new Set();
  let path = [];
  dfs(0, nums);
  const arr = Array.from(res).map(e => e.split('.'));
  arr.push([]);
  return arr;

  function dfs(startIndex, nums) {
    if (startIndex === nums.length) {
      res.add(path.join('.'));
      return;
    }
    path.length > 0 && res.add(path.join('.'));
    for (let i = startIndex; i < nums.length; i++) {
      path.push(nums[i]);
      dfs(i + 1, nums);
      path.pop();
    }
  }
};
```