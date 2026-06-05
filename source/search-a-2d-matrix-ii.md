---
title: Leetcode 240 - Search a 2d matrix II
date: 2021-10-18 16:55:22
tags:
- binary search
---
**`Note:`**
- Use `binary search`
- ![img](https://pic.leetcode-cn.com/1617066993-AyRIiF-image.png)
- Matrix is just like `BST`, we start from top right.
- When `target === m[i][j]`, we found the result.
- When `target < m[i][j]`, `j--` and we go left.
- When ` target < m[i][j]`, `i++` and we go down.


**`Question:`**

Write an efficient algorithm that searches for a `target` value in an `m x n` integer matrix. The `matrix` has the following properties:

- Integers in each row are sorted in ascending from `left` to `right`.
- Integers in each column are sorted in ascending from top to bottom.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/11/24/searchgrid2.jpg)
```
Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
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
  const row = matrix.length;
  const col = matrix[0].length;
  let i = 0, j = col - 1;
  while (i < row && j>= 0) {
    if (matrix[i][j] === target) return true;
    if (matrix[i][j] > target) {
      j--;
      continue;
    } else {
      i++;
      continue;
    }
  }
  return false;
};
```