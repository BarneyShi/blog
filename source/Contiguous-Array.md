---
title: Leetcode 525 - Contiguous Array
date: 2022-01-07 18:30:45
tags:
- hash table
- presum
---
**`Note:`**
- It's not easy to come up with a `presum` soltution.
- My intuition was `sliding window` but realize it cannot capture the longest length cuz when `0` and `1`'s number are not equal, we can still move `right` instead of shrinking the window by moving `left`.
- Convert all `0` into `-1`, then this question becomes a problem of `finding the max length with sum 0`.
- Then use `presum[]`, and store `presum[i]` into a hash set as we iterate.
- If an interval `[i, j]` meets the requirement of sum 0, then we have `presum[j] - presum[i - 1] === 0`, which means `presum[j] = presum[i - 1]`.
- Note that there might be multiple presum[i] with same value, so map value should an array.

**`Question:`**

Given a binary array `nums`, return the `maximum length` of a contiguous subarray with an `equal number` of 0 and 1.

**`Example:`**
```
Input: nums = [0,1]
Output: 2
Explanation: [0, 1] is the longest contiguous subarray with an equal number of 0 and 1.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var findMaxLength = function(nums) {
  let presum = [...new Array(nums.length + 1).fill(0)];
  nums = nums.map(e => {
    if (e === 0) return -1;
    return 1; 
  });
  for (let i = 1; i < presum.length; i++) {
    presum[i] = presum[i - 1] + nums[i - 1];
  }
  let map = new Map();
  let ans = 0;
  for (let i = 0; i < presum.length; i++) {
    if (map.has(presum[i])) {
      for (const sum of map.get(presum[i])) {
        if (i - sum > ans) ans = i - sum;
      }
      map.set(presum[i], [...map.get(presum[i], i)]);
      continue;
    } 
    map.set(presum[i], [i]);
  }
  return ans;
};
```