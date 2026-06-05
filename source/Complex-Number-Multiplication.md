---
title: Leetcode 537 - Complex Number Multiplication
date: 2022-01-09 17:33:19
tags:
- math
---
**`Note:`**
- Use `split` with regex to accelerate.

**`Question:`**

A `complex` number can be represented as a string on the form "real+imaginaryi" where:

- `real` is the real part and is an integer in the range [-100, 100].
- `imaginary` is the imaginary part and is an integer in the range [-100, 100].
- $i^2 == -1.$

Given two complex numbers `num1` and `num2` as strings, return a string of the complex number that represents their multiplications.

**`Example:`**
```
Input: num1 = "1+1i", num2 = "1+1i"
Output: "0+2i"
Explanation: (1 + i) * (1 + i) = 1 + i2 + 2 * i = 2i, and you need convert it to the form of 0+2i.
```

**`Code:`**
```javascript
/**
 * @param {string} num1
 * @param {string} num2
 * @return {string}
 */
var complexNumberMultiply = function(num1, num2) {
  num1 = num1.split(/\+|i/);
  num2 = num2.split(/\+|i/);
  const real1 = num1[0] - 0;
  const img1 = num1[1] - 0;
  const real2 = num2[0] - 0;
  const img2 = num2[1] - 0;
  return (real1 * real2 - img1 * img2) + '+' + (real1 * img2 + real2 * img1) + 'i';
};
```