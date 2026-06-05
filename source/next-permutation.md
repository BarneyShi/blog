---
title: Leetcode 31 - Next permutation
date: 2021-11-22 16:44:06
tags:
- double pointers
---
**`Note:`**
- Update on 2nd review:
  - Some key points: 
    - After finding the first `num[i]` that's smaller than `nums[i+1]`. We can be sure that `num[i+1] to nums[len - 1]` is in `ASCENDING` order!
    - So the `nums[j]` we're looking for is just the first element that meets `nums[j] > nums[i]`.
    - Then to reverse the rest array, because `nums[i+1] to nums[len - 1]` is in ascending order, we can just use `DOUBLE POINTERS`!
- Finding next one bigger than `[1,2,3,4]` is just like finding next one bigger than `1234`.
- Starting from the lowest digit, when we find the first `nums[i] < nums[i + 1]`, it means `[j + 1, end]` is in `descending order`. 
- We can def find the `first num[j]` that is bigger than `nums[i]`.
- But like `[1,5,2,4,3,2]`, after swapping 2 with 3, we get `[1,5,3,4,2,2]`. Actually, we can make it smaller!
- How?
- If all nums after `3` can be arrange in `ascending order`, we can make it smaller!.
- Sort nums in `[i + 1, end]`

**`Question:`**

Implement `next permutation`, which rearranges numbers into the lexicographically next greater permutation of numbers.

If such an arrangement is not possible, it must rearrange it as the lowest possible order (i.e., sorted in ascending order).

The replacement must be `in place` and use only constant extra memory.

**`Example:`**
```
Input: nums = [1,2,3]
Output: [1,3,2]
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
 var nextPermutation = function(nums) {
  let i = nums.length - 2;
  while (i >= 0 && nums[i] >= nums[i + 1]) {
    i--;
  }
  for (let j = nums.length - 1; j > i; j--) {
    if (nums[j] > nums[i]) {
      [nums[i], nums[j]] = [nums[j], nums[i]];
      break;
    }
  }
  // If nums is in `descending order`, i will be -1. Then `left === 0`, we are actually reversing nums.
  let left = i + 1, right = nums.length - 1;
  while (left < right) {
    [nums[left], nums[right]] = [nums[right], nums[left]];
    left++;
    right--;
  }
};
```