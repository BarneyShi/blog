---
title: Leetcode 80 - Remove duplicates from sorted array II
date: 2021-11-23 23:12:47
tags:
- double pointers
---
**`Note:`**
- ![img](https://i.imgur.com/PuUyIBv.png)
- `Slow` pointer contains the answer `k`.
- `Fast` to find the next e that is different from `nums[left - 2]`.

**`Question:`**

Given an integer array `nums` sorted in `non-decreasing order`, remove some duplicates `in-place` such that each unique element appears `at most twice`. The `relative order` of the elements should be kept the `same`.

Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array `nums`. More formally, if there are k elements after removing the duplicates, then the first `k` elements of `nums should` hold the final result. It does not matter what you leave beyond the first k elements.

Return `k` after placing the final result in the first `k` slots of `nums`.

**`Example:`**
```
Input: nums = [1,1,1,2,2,3]
Output: 5, nums = [1,1,2,2,3,_]
Explanation: Your function should return k = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively.
It does not matter what you leave beyond the returned k (hence they are underscores).
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var removeDuplicates = function(nums) {
  let left = 0, right = 0;
  while (right < nums.length) {
    while (nums[right] === nums[left - 2]) {
      right++;
    }
    // Need to check right, otherwise `k` might be bigger than the correct answer by `1`. 
    // We will wrongfully return some thing like `[..., undefined]`.
    if (right < nums.length) {
      nums[left] = nums[right];
      left++;
      right++;
    }
  }
  return left;
};
```