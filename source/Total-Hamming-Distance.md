---
title: Leetcode 477 - Total Hamming Distance
date: 2022-01-01 22:00:09
tags:
- bitwise
---
**`Note:`**
- Every time use mask to seprate nums into two groups based on the bit is `0` or `1`.
- Then at that position, there would be `a` * `b` combinations.
- Update ans and our `mask` to keep going.

**`Question:`**

The `Hamming distance` between two `integers` is the number of positions at which the corresponding `bits` are `different`.

Given an integer array nums, return the `sum` of Hamming distances between all the pairs of the integers in nums.

**`Example:`**
```
Input: nums = [4,14,2]
Output: 6
Explanation: In binary representation, the 4 is 0100, 14 is 1110, and 2 is 0010 (just
showing the four bits relevant in this case).
The answer will be:
HammingDistance(4, 14) + HammingDistance(4, 2) + HammingDistance(14, 2) = 2 + 2 + 2 = 6.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var totalHammingDistance = function(nums) {
  let ans = 0;
  let zero = 0, one = 0;
  for (let i = 0; i < 32; i++) {
    zero = 0;
    one = 0;
    const mask = 1 << i;
    for (const n of nums) {
      if ((n & mask) !== 0) {
        one++;
      } else {
        zero++;
      }
    }
    ans += zero * one;
  }
  return ans;
};
```