---
title: Leetcode 191 - Number of 1 bits
date: 2021-08-20 01:06:13
tags:
- leetcode
- math
- easy
---
Write a function that takes an unsigned integer and returns the number of '1' bits it has (also known as the Hamming weight).

**Note:** Another Hole-in-One! The pro way is to use bit manipulation - use `>>` to adjust the last digit of n and use `&` to get the last digit. This question is really similar to `Reverse Bits`. 

**Example 1:**
```
Input: n = 00000000000000000000000000001011
Output: 3
Explanation: The input binary string 00000000000000000000000000001011 has a total of three '1' bits.
```
```javascript
/**
 * @param {number} n - a positive integer
 * @return {number}
 */
var hammingWeight = function(n) {
  let ans = 0;
  for (let i = 0; i < 32; i++) {
    const lastDigit = n & 1;
    if (lastDigit) {
      ans += 1;
    }
    n >>= 1;
  }
  return ans;
};
```