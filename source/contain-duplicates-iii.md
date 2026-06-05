---
title: Leetcode 220 - Contain duplicates III
date: 2021-12-01 01:12:21
tags:
- bucket sort
- sort
- hash table
- sliding window
---
**`Note:`**
- We can maintain a sliding window with size `k`.
- How do we put elements like `[0, 1, 2, 3], t = 3` into the same bucket?
  - Using `x / t` doesn't work when ` t == -1`. Let's use `floor(x / t + 1)` (In other languages other than JS, need to dicuss based on x is positive or not because in JS floor(-1.5) == -2).
- Use `map.set(bucketIndex, nums[i])` to store elements.
- Always make sure there are only `k` buckets.
  - When `i >= k`, we need to delete the bucket that `nums[i - k]` belongs to. Otherwise, in `i + 1`, there will be one extra bucket.
  - ![img](https://i.imgur.com/vTfsfUz.png)

**`Question:`**

Given an integer array `nums` and two integers `k` and `t`, return `true` if there are two distinct indices `i` and `j` in the array such that `abs(nums[i] - nums[j]) <= t` and `abs(i - j) <= k`.

**`Example:`**
```
Input: nums = [1,2,3,1], k = 3, t = 0
Output: true
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} k
 * @param {number} t
 * @return {boolean}
 */
var containsNearbyAlmostDuplicate = function(nums, k, t) {
  let buckets = new Map();
  function getBucketIndex(n) {
    return Math.floor(n / (t + 1));
  }
  if (t < 0) return false;
  for (let i = 0; i < nums.length; i++) {
    const index = getBucketIndex(nums[i]);
    if (buckets.has(index)) return true;
    if (buckets.has(index - 1) && Math.abs(buckets.get(index - 1) - nums[i]) <= t) return true;
    if (buckets.has(index + 1) && Math.abs(buckets.get(index + 1) - nums[i]) <= t) return true;

    buckets.set(index, nums[i]);
    if (i >= k) buckets.delete(getBucketIndex(nums[i - k]));
  }
  return false;
};
```