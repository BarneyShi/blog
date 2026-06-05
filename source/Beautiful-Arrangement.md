---
title: Leetcode 526 - Beautiful Arrangement
date: 2022-01-06 18:38:27
tags:
- dfs
- backtracking
---
**`Note:`**
- Use backtracking to find all permutations.
- While doing dfs, pre-check if it meets the requirement of `beautiful arrangements`.

**`Question:`**

Suppose you have `n` integers labeled `1` through `n`. A permutation of those n integers `perm` (1-indexed) is considered a beautiful arrangement if for every i `(1 <= i <= n)`, either of the following is true:

- `perm[i]` is divisible by `i`.
- `i` is divisible by `perm[i]`.

Given an integer `n`, return the number of the beautiful arrangements that you can construct.

**`Example:`**
```
Input: n = 2
Output: 2
Explanation: 
The first beautiful arrangement is [1,2]:
    - perm[1] = 1 is divisible by i = 1
    - perm[2] = 2 is divisible by i = 2
The second beautiful arrangement is [2,1]:
    - perm[1] = 2 is divisible by i = 1
    - i = 2 is divisible by perm[2] = 1
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @return {number}
 */
var countArrangement = function(n) {
  let nums = [...new Array(n)];
  nums = nums.map((e, i) => i + 1);
  let perms = [];
  let path = [];
  let used = new Set();
  backtracking(used);
  return perms.length;
  
  function backtracking(used) {
    if (path.length === nums.length) {
      perms.push([...path]);
    }
    for (let i = 0; i < nums.length; i++) {
      if (used.has(i)) continue;
      if ((nums[i] % (path.length + 1) !== 0) && ((path.length + 1) % nums[i] !== 0)) continue;
      used.add(i);
      path.push(nums[i]);
      backtracking(used);
      path.pop();
      used.delete(i);
    }
  }
};
```