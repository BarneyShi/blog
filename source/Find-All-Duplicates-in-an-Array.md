---
title: Leetcode 442 - Find All Duplicates in an Array
date: 2021-12-21 21:43:41
tags:
- hash table
---
**`Note:`**
- To finish with `O(1)` extra space? We'd better use the orignal array.
- It's a method called `in-place hash`?
- Because all number are between `[1,n]`, and the length of nums is `n`. So the correct order should be `[1,2,3..n]` where `nums[i] = i - 1`.
- If `nums[i]` is not in the correct place, which means `nums[i] !== nums[nums[i] - 1]`. We should swap them.
- After swapping, don't move `i`, we need to do this again on the new `nums[i]`.
- What about `nums[i] == nums[nums[i] - 1]`:
  - If `i !== nums[i] - 1`, it means we've met a num that appears twice. 
  - If `i === nums[i] - 1`, it means the num is in the correct place, let's `i++`.

**`Question:`**

Given an integer array `nums` of length `n` where all the integers of `nums` are in the range `[1, n]` and each integer appears once or twice, return an array of all the integers that appears `twice`.

You must write an algorithm that runs in `O(n)` time and uses only `constant` extra space.

**`Example:`**
```
Input: nums = [4,3,2,7,8,2,3,1]
Output: [2,3]
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number[]}
 */
 var findDuplicates = function(nums) {
  let ans = new Set();
  let i = 0;
  while (i < nums.length) {
    if (nums[i] !== nums[nums[i] - 1]) {
      const tmp = nums[i] - 1;
      [nums[i], nums[tmp]] = [nums[tmp], nums[i]];
    } else {
      if (i !== nums[i] - 1) {
        ans.add(nums[i]);
      }
      i++;
    }
  }
  return Array.from(ans);
};
```