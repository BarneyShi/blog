---
title: Leetcode 347 - Top K frequent elements
date: 2021-10-10 21:26:17
tags:
- bucket sort
- array
---
**`Note:`**
- Cannot use normal sort methods because of the limit of time complexity.
- Use `bucket sort` because its average time complexity is `O(n)`.
- Use `map` to track the frequencies.
- Iterate map and assign `num` which has the same frequency to `bucket[frequency]`.
- Iterate backwards and find `k` elements as the result.

**`Question:`**

Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

**`Example:`**
```
Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
var topKFrequent = function(nums, k) {
  let map = new Map();
  let result = [];
  let bucket = [];
  for (let i = 0; i < nums.length; i++) {
    if (!map.has(nums[i])) {
      map.set(nums[i], 1);
    } else {
      map.set(nums[i], map.get(nums[i]) + 1);
    }
  }
  map.forEach((value, key) => {
    if (!bucket[value]) {
      bucket[value] = [key];
    } else {
      bucket[value].push(key);
    }
  })
  for (let i = bucket.length - 1; i >= 0 && k > 0; i--) {
    if (bucket[i]) {
      for (const char of bucket[i]) {
        if (k === 0) break;
        result.push(char);
        k--;
      }
    }
  }
  return result;
};
```