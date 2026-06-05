---
title: Leetcode 523 - Continuous Subarray Sum
date: 2022-01-05 17:53:02
tags:
- presum
- math
---
**`Note:`**
- Use `presum[]` to simplify calculations. Rememebr to add an extra 0 t0 the head for calculating total `sum`.
- Let's say interval `[i, j]` is qualified, which means `presum[j] - presum[i - 1] = n * k`.
- Which gives us $\frac{presum[j]}{k} - \frac{presum[i - 1]}{k} = n$;
- Based on `Congruence modulo`, we know that `presum[j]` and `presum[i-1]` have `mod` towards `k`.
- So starting from `2`, for every `j`, if hash set has `presum[j] % k`, return true. 

**`Question:`**

Given an integer array `nums` and an integer `k`, return `true` if `nums` has a continuous subarray of size at least two whose elements sum up to a multiple of `k`, or `false` otherwise.

An integer `x` is a multiple of `k` if there exists an integer n such that `x = n * k`. `0` is always a multiple of `k`.

**`Example:`**
```
Input: nums = [23,2,4,6,7], k = 6
Output: true
Explanation: [2, 4] is a continuous subarray of size 2 whose elements sum up to 6.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {boolean}
 */
var checkSubarraySum = function(nums, k) {
  let presum = [...new Array(nums.length + 1).fill(0)];
  for (let i = 1; i <= nums.length; i++) {
    presum[i] = presum[i - 1] + nums[i - 1];
  }
  let set = new Set();
  // Note that the boundary is `<=`, not just <.
  for (let j = 2; j <= nums.length; j++) {
    set.add(presum[j - 2] % k);
    if (set.has(presum[j] % k)) return true;
  }
  return false;
};
```