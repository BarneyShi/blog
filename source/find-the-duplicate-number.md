---
title: Leetcode 287 - Find the duplicate number
date: 2021-10-29 21:53:39
tags:
- binary search
---
**`Note:`**
- We need `binary search` but apparently, we cannot do that on `nums` because it's not sorted.
- By the definition, the range `[1, n]` can be the target of binary search.
- Find `middle`, then iterate through `nums`, and record num that are `smaller` than `middle`.
- If `count` is strictly bigger than `middle`, it means there must be more than `middle` number between `[1, middle]`. So the repetitve num must be inside. So, move `right = middle`.
- If `count <= middle`, we can say there is def no repetitve num between `[1, middle]`. Move `left = middle + 1`.

**`Question:`**

Given an array of integers `nums` containing `n + 1` integers where each integer is in the range `[1, n]` inclusive.

There is only one repeated number in `nums`, return this repeated number.

You must solve the problem without modifying the array `nums and` uses only constant extra space.

**`Example:`**
```
Input: nums = [1,3,4,2,2]
Output: 2
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var findDuplicate = function(nums) {
  const n = nums.length - 1;
  let left = 1, right = n;
  while (left < right) {
    const middle = ~~((left + right) / 2);
    let smaller = 0;
    for (const num of nums) {
      if (num <= middle) smaller++;
    }
    if (smaller > middle) {
      right = middle;
    } else {
      left = middle + 1;
    }
  }
  return left;
};
```