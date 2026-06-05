---
title: Leetcode 43 - Multiply strings
date: 2021-11-22 18:09:30
tags:
---
**`Note:`**
- `123` can be written as `100 + 20 + 3`, `456` can be written as `400 + 50 + 6`.
- Calculate `100*400, 100*50, ... 3*6`, and put them all in an array.
- To calculate `100*400`, just calculate `num1[0]*num2[0] + trailing 0s`.
- Make a helper function `addTwoString(n1, n2)`.

**`Question:`**

Given two non-negative integers `num1` and `num2` represented as strings, return the product of `num1` and `num2`, also represented as a string.

Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.

**`Example:`**
```
Input: num1 = "123", num2 = "456"
Output: "56088"
```

**`Code:`**
```javascript
/**
 * @param {string} num1
 * @param {string} num2
 * @return {string}
 */
var multiply = function (num1, num2) {
  let arr1 = [];
  let arr2 = [];
  for (let i = 0; i < num1.length; i++) {
    num1[i] !== '0' && arr1.push(num1[i] + '0'.repeat(num1.length - 1 - i));
  }
  for (let i = 0; i < num2.length; i++) {
    num2[i] !== '0' && arr2.push(num2[i] + '0'.repeat(num2.length - 1 - i));
  }

  let sum = [];
  for (let i = 0; i < arr1.length; i++) {
    for (let j = 0; j < arr2.length; j++) {
      const a = arr1[i];
      const b = arr2[j];
      sum.push(a[0] * b[0] + '0'.repeat(a.length + b.length - 2));
    }
  }

  let acc = '0';
  for (const e of sum) {
    acc = addTwoString(e, acc);
  }
  return acc.replace(/^0+/g, '0');

  function addTwoString(a, b) {
    let prev = 0;
    let ans = '';
    while (a.length > 0 || b.length > 0) {
      let sum = prev;
      prev = 0;
      if (a.length > 0) {
        sum += a[a.length - 1] - 0;
        a = a.slice(0, a.length - 1);
      }
      if (b.length > 0) {
        sum += b[b.length - 1] - 0;
        b = b.slice(0, b.length - 1);
      }
      if (sum >= 10) {
        sum -= 10;
        prev = 1;
      }
      ans = sum + ans;
    } 
    if (prev === 1) {
      ans = '1' + ans;
    }
    return ans;
  }
};
```