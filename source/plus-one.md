---
title: Leetcode 66 - Plus one
date: 2021-10-20 20:52:32
tags:
---
**`Note:`**
- Be careful when there are `9`s. Especially when you have to add another `1` in front of the array.

**`Question:`**

You are given a `large integer` represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.

Increment the large integer by one and return the resulting array of digits.

**`Example:`**
```
Input: digits = [1,2,3]
Output: [1,2,4]
Explanation: The array represents the integer 123.
Incrementing by one gives 123 + 1 = 124.
Thus, the result should be [1,2,4].
```

**`Code:`**
```javascript
/**
 * @param {number[]} digits
 * @return {number[]}
 */
var plusOne = function (digits) {
  return recursionAddition(digits, digits.length - 1);

  function recursionAddition(digits, index) {
    if (index < 0) {
      digits = [1].concat(...digits);
      return digits;
    }
    if (digits[index] < 9) {
      digits[index]++;
      return digits; 
    }
    digits[index] = 0;
    return recursionAddition(digits, index - 1)
  }
};
```