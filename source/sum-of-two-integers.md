---
title: Leetcode 371 - Sum of two integers
date: 2021-11-16 20:41:42
tags:
- bitwise
---
**`Note:`**
- Not hard to come up with bit wise methods.
- The result must be a `32-bit` integer. We init `res` as `0`. 
- Use `prev` to carry extra 1 from prev digit.
- For each digit, how should we add the result into `res`?
- Use `curSum << i`, it will right shift `1` and use `|` to add up with `res`.
- Should we care about `negative` numbers?
  - No. Actually, when we do `a >> 1` and `a < 0`, the left most will be filled with 0. If it's a while loop, it would be a loop hole. But we only do this `32` times. So, it will def terminate. 

**`Question:`**

Given two integers a and b, return the sum of the two integers without using the operators + and -.

**`Example:`**
```
Input: a = 1, b = 2
Output: 3
```

**`Code:`**
```javascript
/**
 * @param {number} a
 * @param {number} b
 * @return {number}
 */
 var getSum = function(a, b) {
  let prev = 0;
  let res = 0;
  for (let i = 0; i < 32; i++) {
    const lastOfA = (a >>> i) & 1;
    const lastOfB = (b >>> i) & 1;
    if (lastOfA === 1 && lastOfB === 1) {
      res = res | (prev << i);
      prev = 1;
    } else if (lastOfA === 1 || lastOfB === 1) {
      res = res | ((1 ^ prev) << i);
    } else {
      res = res | (prev << i);
      prev = 0;
    }
  }
  return res;
};
```