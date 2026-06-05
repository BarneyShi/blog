---
title: Leetcode 594 - Longest Harmonious Subsequence
date: 2021-11-19 17:34:31
tags:
- sliding window
- hash table
- double pointers
---
**`Note:`**
- Sliding window
  - While `nums[j] - nums[i] <= 1`, compare with maxLen and move `j` by 1.
  - While `nums[j] - nums[i] > 1`, move `i` until `nums[j] - nums[i] <= 1`.
- Hash table
  - Put all nums with counts into a map.
  - For each [key,val], search `key + 1` an `key - 1` and compare len;

**`Question:`**

We define a `harmonious` array as an array where the difference between its maximum value and its minimum value is `exactly 1`.

Given an integer array `nums`, return the length of its longest harmonious subsequence among all its possible subsequences.

A `subsequence` of array is a sequence that can be derived from the array by deleting some or no elements without changing the order of the remaining elements.

**`Example:`**
```
Input: nums = [1,3,2,2,5,2,3,7]
Output: 5
Explanation: The longest harmonious subsequence is [3,2,2,2,3].
```

**`Code:`**

**`Sliding window O(NlogN)`**
```javascript
var findLHS = function(nums) {
  nums = nums.sort((a, b) => a - b);
  let res = 0;
  let i = 0;
  for (let j = 0; j < nums.length; j++) {
    while (nums[j] - nums[i] > 1) i++;
    if (nums[j] - nums[i] === 1) res = Math.max(res, j - i + 1);
  }
  return res;
};
```

**`Hash table O(N)`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var findLHS = function(nums) {
  let map = new Map();
  let res = 0;
  for (const num of nums) {
    if (!map.has(num)) {
      map.set(num, 1);
    } else {
      map.set(num, map.get(num) + 1);
    }
  }
  for (const [key, val] of map) {
    if (map.has(key - 1)) {
      res = Math.max(res, map.get(key - 1) + map.get(key));
    }
    if (map.has(key + 1)) {
      res = Math.max(res, map.get(key) + map.get(key + 1));
    }
  }
  return res;
};
```