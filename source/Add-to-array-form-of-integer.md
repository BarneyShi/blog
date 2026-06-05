---
title: Leetcode 989 - Add to array form of integer
date: 2021-10-29 17:23:02
tags:
- array
---
**`Note:`**
- Same old patterns, just use `prev` to carry the extra one if sum if bigger than 10.

**`Question:`**

The array-form of an integer `num` is an array representing its digits in left to right order.

- For example, for `num = 1321`, the array form is `[1,3,2,1]`.
Given `num`, the array-form of an integer, and an integer k, return the array-form of the integer num + k.

**`Example:`**
```
Input: num = [1,2,0,0], k = 34
Output: [1,2,3,4]
Explanation: 1200 + 34 = 1234
```

**`Code:`**
```javascript
/**
 * @param {number[]} num
 * @param {number} k
 * @return {number[]}
 */
var addToArrayForm = function (num, k) {
  let kArr = [];
  while (k !== 0) {
    kArr.unshift(k % 10);
    k = ~~(k / 10);
  }
  if (num.length < kArr.length) [num, kArr] = [[...kArr], [...num]];
  let prev = 0;
  for (let i = num.length - 1; i >= 0; i--) {
    j = i - (num.length - kArr.length);
    sum = prev + (j >= 0 ? num[i] + kArr[j] : num[i]);
    if (sum <= 9) {
      prev = 0;
      num[i] = sum;
    } else {
      prev = 1;
      num[i] = sum - 10;
    }
  }
  if (prev === 1) num = [1].concat(num);
  return num;
};
```