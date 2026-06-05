---
title: Leetcode 46 - Permutations
date: 2021-09-11 18:19:18
tags:
- dfs
- backtracking
---
**`Note:`**
- This is a backtracking problem.
- We don't need `startIndex` because each path must contain all elements.
- We do need a `used` array to keep track if we've used the element.

Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

**Example**
```
Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
```

```javascript
/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var permute = function(nums) {
  let result = [];
  let path = [];
  let used = new Set();
  backtracking(used);
  return result;

  function backtracking(used) {
    if (path.length === nums.length) {
      result.push([...path]);
      return;
    }
    for (let i = 0; i < nums.length; i++) {
      if (used.has(i)) continue;
      path.push(nums[i]);
      used.add(i);
      backtracking(used);
      path.pop();
      used.delete(i);
    }
  }
};
```

