---
title: Leetcode 503 - Next greater element II
date: 2021-10-26 01:12:36
tags:
- monotonic stack
---
**`Note:`**
- Concat `nums[0, len - 2]` to nums to build a new array.
- Use `nums[i % len]` to map index.
- Actually, you can either iterate backwards or forwards to build a monotone stack.

**`Question:`**

Given a `circular` integer array nums (i.e., the next element of nums[nums.length - 1] is nums[0]), return the next greater number for every element in nums.

The next greater number of a number x is the first greater number to its traversing-order next in the array, which means you could search circularly to find its next greater number. If it doesn't exist, return `-1` for this number.

**`Example:`**
```
Input: nums = [1,2,1]
Output: [2,-1,2]
Explanation: The first 1's next greater number is 2; 
The number 2 can't find next greater number. 
The second 1's next greater number needs to search circularly, which is also 2.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number[]}
 */
var nextGreaterElements = function(nums) {
  let monoStack = [];
  let res = [...Array(nums.length).fill(-1)];
  const len = nums.length;
  for (let i = 2*len - 1; i >= 0; i--) {
    while (monoStack.length && monoStack[monoStack.length - 1] <= nums[i % len]) {
      monoStack.pop();
    }
    res[i % len] = monoStack.length ? monoStack[monoStack.length - 1] : -1;
    monoStack.push(nums[i % len]);
  }
  
  return res;
};
```