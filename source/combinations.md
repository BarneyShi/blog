---
title: Leetcode 77 - Combinations
date: 2021-08-21 17:46:32
tags:
- dfs
- backtracking
---
Given two integers n and k, return all possible combinations of k numbers out of the range [1, n].

You may return the answer in any order.

**Example 1:**

Input: n = 4, k = 2
Output:
[
  [2,4],
  [3,4],
  [2,3],
  [1,2],
  [1,3],
  [1,4],
]
**Note:** One of the most typical backtracking problems. Remeber to use spread operator while pushing element into ans because we are passing `path` as `reference`. `path` always points to a place in memory and this variable will eventually be empty because of our `undo` operations in code. So if we don't use `spread operator` to clone a new array and push it into `ans`, what we get will just be empty.
```javascript
/**
 * @param {number} n
 * @param {number} k
 * @return {number[][]}
 */
var combine = function (n, k) {
  let nums = [... new Array(n)];
  for (let i = 0; i < n; i++) {
    nums[i] = i + 1;
  }
  let result = [];
  let path = [];
  backtracking(nums, 0);
  return result;

  function backtracking(nums, startIndex) {
    if (path.length === k) {
      result.push([...path]);
      return;
    }
    for (let i = startIndex; i < nums.length; i++) {
      path.push(nums[i]);
      backtracking(nums, i + 1);
      path.pop();
    }
  }
};
```
