---
title: Leetcode 1005 - Max sum of array after k negations
date: 2021-10-06 01:53:22
tags:
- greedy
---
**`Note:`**
- `Brute force`
  - `Sort`, if all positive, then based on `k` is `even` or `odd`, alternate the value of `min`. If there are negative values, negate them first, if `k` is still `positive`, alternate the `min`.
- `Greedy`
  - Sort based on `absolute value` - So if there are negative nums, we can get `bigger sum` by negating negative nums with `big abs values`.
  - If `k` is still positive and odd, negate the `min`.

Given an integer array nums and an integer k, modify the array in the following way:

choose an index i and replace nums[i] with -nums[i].
You should apply this process exactly k times. You may choose the same index i `multiple` times.

Return the largest possible sum of the array after modifying it in this way.

**Example**
```
Input: nums = [2,-3,-1,5,-4], k = 2
Output: 13
Explanation: Choose indices (1, 4) and nums becomes [2,3,-1,5,4].
```
**`Brute Force`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var largestSumAfterKNegations = function(nums, k) {
  nums.sort((a,b) => a - b);
  if (nums[0] >= 0) {
    if (k % 2 === 0) {
      return sum(nums);
    } else {
      return -nums[0] + sum(nums.slice(1));
    }
  } else {
    for (let i = 0; i < nums.length && k > 0; i++) {
      if (nums[i] >= 0) break;
      nums[i] = -nums[i];
      k--;
    }
    if (k > 0) {
      nums.sort((a,b) => a - b);
      if (k % 2 === 0) {
        return sum(nums);
      } else if (k % 2 === 1) {
        return -nums[0] + sum(nums.slice(1));
      }
    }
    return sum(nums);
  }
};
function sum(nums) {
  return nums.reduce((acc, cur) => acc + cur);
}
```

**`Greedy`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var largestSumAfterKNegations = function(nums, k) {
  nums.sort((a, b) => Math.abs(b) - Math.abs(a));
  for (let i = 0; i < nums.length && k > 0; i++) {
    if (nums[i] < 0) {
      nums[i] *= -1;
      k--;
    }
  }

  if (k % 2 === 1) nums[nums.length - 1] *= -1
  return nums.reduce((acc, cur) => acc + cur);
};
```