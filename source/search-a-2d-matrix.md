---
title: Leetcode 74 - Search a 2D matrix
date: 2021-10-18 17:51:44
tags:
- binary search
---
**`Note:`**
- Use `binary search` by concating all elements together to form a sorted array.
- Different ways to flat an array
  - `array.flat()` (Not working in IE.)
  - `[].concat(...array)`
- Also, remember add or minus `1` toward `middle` otherwise it won't work.. (Silly mistake)

**`Question:`**

Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

- Integers in each row are sorted from left to right.
- The first integer of each row is greater than the last integer of the previous row.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/10/05/mat.jpg)
```
Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
Output: true
```

**`Code:`**
```javascript
/**
 * @param {number[][]} matrix
 * @param {number} target
 * @return {boolean}
 */
var searchMatrix = function(matrix, target) {
  matrix = [].concat(...matrix);
  let left = 0; right = matrix.length - 1;
  while (left <= right) {
    const middle = Math.floor(left + (right - left) / 2);
    if (target === matrix[middle]) return true;
    if (target > matrix[middle]) {
      left = middle + 1;
    } else {
      right = middle - 1;
    }
  }
  return false;
};
```