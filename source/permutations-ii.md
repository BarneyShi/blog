---
title: Leetcode 47 - Permutations II
date: 2021-09-13 02:46:34
tags:
- dfs
- backtracking
---
**`Note:`**
- Backtracking question.
- Need a `used[]` array
  - Avoid adding a same element multiple times.
  - Avoid duplicates in `ans[]`.
- It's easier to write an `if` statement for `continue condition` first.
![img](https://i.ibb.co/4d321Ts/Screen-Shot-2021-09-13-at-2-51-14-AM.png)

Given a collection of numbers, nums, that might contain duplicates, return all possible unique permutations in any order.
**Example**
```
Input: nums = [1,1,2]
Output:
[[1,1,2],
 [1,2,1],
 [2,1,1]]
```

```javascript
/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var permuteUnique = function(nums) {
  nums.sort((a, b) => a - b);
  let path = [];
  let result = [];
  let used = new Set();
  backtracking(used);
  return result;

  function backtracking(used) {
    if (path.length === nums.length) {
      result.push([...path]);
      return;
    }

    for(let i = 0; i < nums.length; i++) {
      if (used.has(i)) continue;
      if (nums[i] === nums[i-1] && !used.has(i-1)) continue;
      path.push(nums[i]);
      used.add(i);
      backtracking(used);
      path.pop();
      used.delete(i);
    }
  }
};
```