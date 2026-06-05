---
title: Leetcode 29 - Divide two ints
date: 2021-10-28 23:43:18
tags:
- math
---
**`Note:`**
- Take `100 / 3` for example:
  - If we just do `100 - 3` every time and count the num, it's be really slow!
  - Instead, we use `>>>` unsigned left shift to divide dividend every time, so we can quicklly find the first number that is `bigger` than divisor.
    - BTW, we use `>>>` instead of `divisor << i` coz it can `prevent overflow`.
  - Make sure `100 >>> i >= 3`.
  - After we find `100 >>> 1` for 5 times, which means we've found `2^5 * 3 <= 100`;
  - Then `100 - 32*3 = 4`
  - Let dividend = 4, and add 32 to res. Do the iteration again.
- Use `>>>` on `2**31` otherwise you'll get a negative number coz `2**31`'s first digit is `1` and JS will assume its a negative number after shifting it.

**`Question:`**

Given two integers `dividend` and `divisor`, divide two integers without using multiplication, division, and mod operator.

The integer division should truncate toward zero, which means losing its fractional part. For example, 8.345 would be truncated to 8, and -2.7335 would be truncated to -2.

Return the quotient after dividing `dividend` by `divisor`.

Note: Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−231, 231 − 1]. For this problem, if the quotient is strictly greater than 231 - 1, then return 231 - 1, and if the quotient is strictly less than -231, then return -231.

**`Example:`**
```
Input: dividend = 10, divisor = 3
Output: 3
Explanation: 10/3 = 3.33333.. which is truncated to 3.
```

**`Code:`**
```javascript
/**
 * @param {number} dividend
 * @param {number} divisor
 * @return {number}
 */
var divide = function(dividend, divisor) {
  const MIN = -1 * 2**31, MAX = 2**31 - 1;
  if (dividend === MIN && divisor === -1) return MAX;
  if (dividend === MIN && divisor === 1) return MIN;
  const isNegative = (dividend ^ divisor) < 0;
  let [a, b] = [Math.abs(dividend), Math.abs(divisor)];
  let res = 0;
  while (a >= b) {
    for (let i = 31; i >= 0; i--) {
      if (a >>> i >= b) {
        res += 1 << i;
        a -= b * (1 << i);
        break;
      }
    }
  }
  if (!isNegative) return res;
  return 0-res;
};
```