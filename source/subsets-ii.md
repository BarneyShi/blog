---
title: Leetcode 90 - Subsets II
date: 2021-09-12 19:42:52
tags:
- dfs
- backtracking
---
**`Note:`**
- This is a backtracking problem.
- Much like `Combination II`, we need to sort `nums` first and use `used[]` to keep track of prev elements.
- We need to add `every node`, instead of just `leaf node`.

Given an integer array nums that may contain duplicates, return all possible subsets (the power set).

The solution set must not contain duplicate subsets. Return the solution in any order.

**Example**
```
Input: nums = [1,2,2]
Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]
```

```javascript
/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var subsetsWithDup = function(nums) {
  let ans = [[]];
  let path = [];
  let used = [...Array(nums.length).fill(false)];
  nums.sort((a,b) => (a-b));
  backtracking(nums, 0, used);
  return ans;
  
  function backtracking(nums, startIndex, used) {
    for (let i = startIndex; i < nums.length; i++) {
      if (i > 0 && nums[i] == nums[i-1] && used[i-1] == false) {
        continue;
      } else {
        path.push(nums[i]);
        ans.push([...path])
        used[i] = true;
        backtracking(nums, i + 1, used);
        used[i] = false;
        path.pop();
      }
    }
  }
};
```