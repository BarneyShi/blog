---
title: Leetcode 260 - Single number III
date: 2021-10-29 17:01:59
tags:
- bitwise
---
**`Note:`**
- What is lowbit `x & -x`?  
  - Between x and -x, there is only one `single bit` that is set to `1` in both numbers. It's called lowbit, the least significant bit.
- Do XOR on all nums and the result will be `a ^ b` coz all other same numbers will be 0.
- Find the lowbit of sum. By the definition and XOR operation, we can know `a & lowbit === 0` and `b & lowbit !== 0`.
- By this lowbit, we can split nums into two parts, and duplicates will be 0 after XOR. 
- So only unique num will be left.

**`Question:`**

Given an integer array `nums`, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once. You can return the answer in any order.

You must write an algorithm that runs in linear runtime complexity and uses only constant extra space.

**`Example:`**
```
Input: nums = [1,2,1,3,2,5]
Output: [3,5]
Explanation:  [5, 3] is also a valid answer.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number[]}
 */
var singleNumber = function(nums) {
  let sum = 0;
  for (const num of nums) {
    sum ^= num;
  }
  const lowestBit = sum & -sum;
  let a = 0, b = 0;
  for (const num of nums) {
    if (num & lowestBit) {
      a ^= num;
    } else {
      b ^= num;
    }
  }
  return [a, b];
};
```