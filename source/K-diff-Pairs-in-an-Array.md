---
title: Leetcode 532 - K-diff Pairs in an Array
date: 2022-01-08 17:07:38
tags:
- hash table
---
**`Note:`**
- If `k === 0`, we just need to know how many unique duplicate nums there are.
- If `k !== 0`, much like `Two Sum`, use `set.has(n - k)` and `set.has(n + k)` to find pairs.
- To avoid duplicates, we need to store `checked pairs` in another set.

**`Question:`**

Given an array of integers `nums` and an integer `k`, return the number of `unique` k-diff pairs in the array.

A k-diff pair is an integer pair `(nums[i], nums[j])`, where the following are true:

- 0 <= i < j < nums.length
- |nums[i] - nums[j]| == k

Notice that `|val|` denotes the absolute value of val.

**`Example:`**
```
Input: nums = [3,1,4,1,5], k = 2
Output: 2
Explanation: There are two 2-diff pairs in the array, (1, 3) and (3, 5).
Although we have two 1s in the input, we should only return the number of unique pairs.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var findPairs = function (nums, k) {
  let ans = 0;
  let checked = new Set();
  let numSet = new Set(nums);
  let map = new Map();

  if (k === 0) {
    for (const n of nums) {
      if (!map.has(n)) {
        map.set(n, 1);
      } else {
        map.set(n, map.get(n) + 1)
      }
    }
    return [...map].filter(e => e[1] !== 1).length;
  } else {
    for (const n of numSet) {
      if (numSet.has(n - k) && !checked.has(`${n}.${n - k}`)) {
        checked.add(`${n}.${n - k}`);
        ans++;
      }
      if (numSet.has(n + k) && !checked.has(`${n + k}.${n}`)) {
        checked.add(`${n + k}.${n}`);
        ans++;
      }
    }
  }
  return ans;
};
```