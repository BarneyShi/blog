---
title: Leetcode 137 - Single number II
date: 2021-11-10 23:41:35
tags:
- bitwise
---
**`Note:`**
- Definitely use `bitwise` coz it requires constant extra space.
- Because the result is a `32-bit` number. Let's just figure out every digit of it!
- From `i = 0 to 31`, shift every `num` to right and do a mask with `1`, and add them all up.
- Then, we get the value of the digit based on `i`.
- Do a modular operation with `3` because every number except the extra repeats `three times`.
- The `remiander` is the value of current digit.
- Use `<<` to recover it, and do a `|` operation with `res`.

**`Question:`**


Given an integer array `nums` where every element appears three times except for one, which appears exactly once. Find the single element and return it.

You must implement a solution with a `linear` runtime complexity and use only `constant` extra space.

**`Example:`**
```
Input: nums = [2,2,3,2]
Output: 3
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var singleNumber = function(nums) {
  let ans = 0;
  for (let i = 0; i < 32; i++) {
    let sum = 0;
    for (const num of nums) {
      sum += (num >> i) & 1;
    }
    sum %= 3;
    ans |= sum << i;
  }
  return ans;
};
```