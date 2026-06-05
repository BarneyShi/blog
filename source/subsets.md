---
title: Leetcode 78 - Subsets
date: 2021-09-11 22:31:53
tags:
- dfs
- backtracking
---
**`Note:`**
- This is a backtracking problem
- We need to add every `node` into the `ans[]`, not just `leaf` node.
![img](https://img-blog.csdnimg.cn/202011232041348.png)

Given an integer array nums of unique elements, return all possible subsets (the power set).

The solution set must not contain duplicate subsets. Return the solution in any order.

**Example**
```
Input: nums = [1,2,3]
Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
```

```javascript
/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var subsets = function(nums) {
  let ans = [[]]
  let path = [];
  backtracking(nums, 0);
  return ans;
  
  function backtracking(nums, startIndex) {
    if (path.length === nums.length) {
      return;
    }
    
    for (let i = startIndex; i < nums.length; i++) {
      path.push(nums[i]);
      ans.push([...path]);
      backtracking(nums, i + 1);
      path.pop();
    }
  }
};
```
