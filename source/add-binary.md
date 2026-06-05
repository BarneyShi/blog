---
title: Leetcode 67 - Add binary
date: 2021-10-26 02:53:37
tags:
- string
---
**`Note:`**
- Naive brute force.
- Use `prev` to store the extra `1`(if there is one) from pre calculation.

**`Question:`**

Given two binary strings `a` and `b`, return their sum as a binary string.

**`Example:`**
```
Input: a = "1010", b = "1011"
Output: "10101"
```

**`Code:`**
```javascript
/**
 * @param {string} a
 * @param {string} b
 * @return {string}
 */
 var addBinary = function(a, b) {
  if (a.length < b.length) [a,b] = [b,a];
  a = a.split('').map(e => e - 0);
  b = b.split('').map(e => e - 0);
  
  const aLen = a.length;
  const bLen = b.length;
  let prev = 0;
  for (let i = aLen - 1; i >= 0; i--) {
    if (i - (aLen - bLen) >= 0) {
      const sum = a[i] + b[i - (aLen - bLen)] + prev;
      if (sum === 3) {
        a[i] = 1;
        prev = 1;
      } else if (sum === 2) {
        a[i] = 0;
        prev = 1;
      } else if (sum === 1) {
        a[i] = 1;
        prev = 0;
      } else if (sum === 0) {
        a[i] = 0;
        prev = 0;
      }
    } else {
      const sum = a[i] + prev;
      if (sum === 0) {
        a[i] = 0;
        prev = 0;
      } else if (sum === 1) {
        a[i] = 1;
        prev = 0;
      } else if (sum === 2) {
        a[i] = 0;
        prev = 1;
      }
    }
  }
  if (prev === 1) a = [1].concat(a);
  return a.join('');
};
```