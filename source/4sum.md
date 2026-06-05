---
title: Leetcode 18 - 4Sum
date: 2021-10-12 19:09:16
tags:
- double pointers
---
**`Note:`**
- Use `Set` and store nums as strings to remove duplicates.
- Naive method: write a `3sum` help with a for loop, so basically 2 `loops`.

**`Question:`**

Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:

- 0 <= a, b, c, d < n
- a, b, c, and d are `distinct`.
- nums[a] + nums[b] + nums[c] + nums[d] == target
You may return the answer in `any order`.

**`Example:`**
```
Input: nums = [1,0,-1,0,-2,2], target = 0
Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
```

**`Code:`**

**`4Sum optimal`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[][]}
 */
var fourSum = function(nums, target) {
  let result = new Set();
  nums.sort((a, b) => a - b);
  
  for (let i = 0; i < nums.length; i++) {
    for (let j = i + 1; j < nums.length - 2; j++) {
      let left = j + 1;
      let right = nums.length - 1;
      while (left < right) {
        const sum = nums[left] + nums[right];
        if (sum < target - nums[i] - nums[j]) {
          left++;
        } else if (sum > target - nums[i] - nums[j]) {
          right--;
        } else {
          result.add(`${nums[i]},${nums[j]},${nums[left]},${nums[right]}`);
          left++;
          right--;
        }
      }
    }
  }
  return Array.from(result).map(e => e.split(','));
};
```

**`Naive 4Sum with a helper`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[][]}
 */
var fourSum = function(nums, target) {
  nums.sort((a, b) => a - b);
  let result = new Set();
  for (let i = 0; i < nums.length - 2; i++) {
    const threeSumResult = threeSum(nums.slice(i + 1), target - nums[i]);
    if (threeSumResult.length !== 0) {
      threeSumResult.forEach(arr => {
        result.add(`${nums[i]},${arr}`);
      })
    }
  }
  return Array.from(result).map(e => e.split(',').map(str => parseInt(str)));
};

function threeSum(arr, target) {
  let result = new Set();
  for (let i = 0; i < arr.length - 1; i++) {
    if (i >= 1 && arr[i] === arr[i-1]) continue;
    const target_ = target - arr[i];
    let left = i + 1;
    let right = arr.length - 1;
    while (left < right) {
      const sum = arr[left] + arr[right];
      if (sum < target_) {
        left++;
        continue;
      } else if (sum > target_) {
        right--;
        continue;
      } else {
        result.add(`${arr[i]},${arr[left]},${arr[right]}`);
        right--;
        left++;
      }
    }
  }
  return result;
} 
```