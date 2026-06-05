---
title: Leetcode 456 - 132 Pattern
date: 2021-12-28 02:48:41
tags:
- monotonic stack
---
**`Note:`**
- For every `i`, need to find a pair after `i` that `i < k < j`.
- We have to iterate backwards cuz `j` and `k` appear after `i`.
- What kind of data structure do we need?
  - It should store all `3`s (`j`).
  - All `2`s (`k`) that are smaller than `3`s should be popped out.
  - We need to know the `max` of `2`s to make sure `2 > 1`.
- Yes, it's monotonic stack in `non-increasing order`.
- Everytime we pop out a num, compare it with `k` to keep max.
- Once `k > nums[i]`, it means there are `j`s in the stack that are bigger than `i` and `k`. Return true.

**`Question:`**

Given an array of `n` integers `nums`, a 132 pattern is a subsequence of three integers `nums[i]`, `nums[j]` and `nums[k]` such that `i < j < k` and `nums[i] < nums[k] < nums[j]`.

Return `true` if there is a 132 pattern in `nums`, otherwise, return `false`.

**`Example:`**
```
Input: nums = [3,1,4,2]
Output: true
Explanation: There is a 132 pattern in the sequence: [1, 4, 2].
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {boolean}
 */
var find132pattern = function(nums) {
  let stack = [];
  let k = Number.MIN_SAFE_INTEGER;
  for (let i = nums.length - 1; i >= 0; i--) {
    if (k > nums[i]) return true;
    // Cannot use `<=` to compare the top of the stack vs nums[i] cuz it's possbile that `k === j` after popping.
    while (stack.length > 0 && stack[stack.length - 1] < nums[i]) {
      k = Math.max(stack.pop(), k);
    }
    stack.push(nums[i]);
  }
  return false;
};
```