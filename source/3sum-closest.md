---
title: Leetcode 16 - 3Sum closest
date: 2021-11-21 17:05:12
tags:
- double pointers
---
**`Note:`**
- Just like the other `3sum` questions, just use `double pointers`.
- Fix an `i`, then set `left = i + 1, right = len - 1` and move either one by `sum` is bigger than `target` or `not`.
- Keep compare with `res` while moving pointers.

**`Question:`**

Given an integer array `nums` of length `n` and an integer `target`, find three integers in `nums` such that the sum is closest to `target`.

Return the sum of the three integers.

You may assume that each input would have exactly one solution.

**`Example:`**
```
Input: nums = [-1,2,1,-4], target = 1
Output: 2
Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var threeSumClosest = function(nums, target) {
  nums = nums.sort((a, b) => a - b);
  let res = Infinity;
  for (let i = 0; i < nums.length - 2; i++) {
    let left = i + 1, right = nums.length - 1;
    while (left < right) {
      const sum = nums[i] + nums[left] + nums[right];
      if (Math.abs(sum - target) < Math.abs(res - target)) res = sum;
      if (sum < target) {
        left++;
      } else {
        right--;
      }
    }
  }
  return res;
};
```