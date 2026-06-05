---
title: Leetcode 491 - Increasing subsequences
date: 2021-09-12 23:19:39
tags:
- dfs
- backtracking
---
**`Note:`**
- This is a backtracking problem
- To avoid duplicates but also preserve the order of original elements, you cannot just used `sort` on nums.
- Use `used[]` to check duplicates on the `same tree level` before adding them to your path.
- Need to add `every qualified node` instead of just `leaf node`.
 ![img](https://img-blog.csdnimg.cn/20201124200229824.png)
 
Given an integer array nums, return all the different possible increasing subsequences of the given array with at least two elements. You may return the answer in any order.

The given array may contain duplicates, and two equal integers should also be considered a special case of increasing sequence.

**Example**
```
Input: nums = [4,7,6,7]
Output: [[4,7], [4,6], [4,6,7], [7,7], [6,7], [4,7,7]]
```

```javascript
/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var findSubsequences = function(nums) {
  let ans = [];
  let path = [];
  backtracking(nums, 0);
  return ans;
  
  function backtracking(nums, startIndex) {
    let used = [];
    if (path.length > 1) {
      ans.push([...path]);
    }
    for (let i = startIndex; i < nums.length; i++) {
      if (path.length > 0 && nums[i] < path[path.length-1] || used.includes(nums[i])) continue;
        used.push(nums[i]);
        path.push(nums[i]);
        backtracking(nums, i + 1);
        path.pop();
    }
  }
};
```
