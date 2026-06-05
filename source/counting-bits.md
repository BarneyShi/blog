---
title: Leetcode 338 - Counting bits
date: 2021-10-24 03:10:51
tags:
- bitwise
---
**`Note:`**
- Let's just stick to the most naive soltution.
- Use `&` to get the the digit.
- Use `>> 1` to left shift.

**`Question:`**

Given an integer `n`, return an array `ans` of length `n + 1` such that for each i (0 <= i <= n), ans[i] is the `number` of `1's` in the binary representation of i.

**`Example:`**
```
Input: n = 5
Output: [0,1,1,2,1,2]
Explanation:
0 --> 0
1 --> 1
2 --> 10
3 --> 11
4 --> 100
5 --> 101
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @return {number[]}
 */
var countBits = function(n) {
  let arr = [...Array(n + 1).fill(0)];
  for (let i = 0; i < arr.length; i++) {
    arr[i] = countOne(i);
  }
  return arr;
};

function countOne(num) {
  let result = 0;
  while (num !== 0) {
    if (num & 1 === 1) result++;
    num = num >> 1;
  }
  return result;
}
```