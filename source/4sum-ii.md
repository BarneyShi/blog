---
title: Letcode 454 - 4sum II
date: 2021-10-15 00:58:14
tags:
- hash table
- array
---
**`Note:`**
- It looks terrifying but actually it's way more easier than `4Sum I`.
- Use a hash table `map` to store all different sums of `nums1`, `nums2`, and their frequencies. (Store frequencies because each `-sum` from `nums3` and `nums4` can combine with the pair whose key is `sum` in map.)
- Then use another for loop to check all possible `sum` and check if it's been stored in `map` as key `-sum`. The frequency is how many combination we can get for each `sum`.

**`Question:`**

Given four integer arrays `nums1`, `nums2`, `nums3`, and `nums4` all of length n, return the number of tuples (i, j, k, l) such that:

- 0 <= i, j, k, l < n
- nums1[i] + nums2[j] + nums3[k] + nums4[l] == 0

**`Example:`**
```
Input: nums1 = [1,2], nums2 = [-2,-1], nums3 = [-1,2], nums4 = [0,2]
Output: 2
Explanation:
The two tuples are:
1. (0, 0, 0, 1) -> nums1[0] + nums2[0] + nums3[0] + nums4[1] = 1 + (-2) + (-1) + 2 = 0
2. (1, 1, 0, 0) -> nums1[1] + nums2[1] + nums3[0] + nums4[0] = 2 + (-1) + (-1) + 0 = 0
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @param {number[]} nums3
 * @param {number[]} nums4
 * @return {number}
 */
var fourSumCount = function(nums1, nums2, nums3, nums4) {
  const map = new Map();
  let result = 0;

  for (let i = 0; i < nums1.length; i++) {
    for (let j = 0; j < nums2.length; j++) {
      const sum = nums1[i] + nums2[j];
      if (!map.has(sum)) {
        map.set(sum, 1);
      } else {
        map.set(sum, map.get(sum) + 1);
      }
    }
  }

  for (let i = 0; i < nums3.length; i++) {
    for (let j = 0; j < nums4.length; j++) {
      const sum = nums3[i] + nums4[j];
      if (map.has(-sum)) {
        result += map.get(-sum);
      }
    }
  } 
  return result;
};
```