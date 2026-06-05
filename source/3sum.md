---
title: Leetcode 15 - 3Sum
date: 2021-10-12 01:56:28
tags:
- double pointers
---
**`Note:`**
- For each `i`, do what we did in `2sum` between `[i+1, length - 1]` for target `-nums[i]`.
- Even with `Set`, it cannot check whethere we've already had a same array in the `Set`. Because set checks duplicates by `reference` for objects/arrays.
- Sort nums, and avoid duplicates manually.

**`Question:`**

Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must `not` contain `duplicate` triplets.

**`Example:`**
```
Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var threeSum = function(nums) {
  let set = new Set();
  nums.sort((a, b) => a - b);
  for (let i = 0; i < nums.length; i++) {
    let left = i+1; 
    let right = nums.length - 1;
    const target = -nums[i];
    while (left < right) {
      const sum = nums[left] + nums[right];
      if (sum === target) {
        set.add(`${nums[i]},${nums[left]},${nums[right]}`);
        left++;
        right--;
      } else if (sum < target) {
        left++;
      } else {
        right--;
      }
    }
  }
  return Array.from(set).map((a) => a.split(',').map(e => e - 0));
};
```