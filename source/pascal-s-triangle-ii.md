---
title: Leetcode 119 - Pascal's triangle II
date: 2021-11-03 03:44:20
tags:
---
**`Note:`**
- Memo pre-calculated result makes it faster.

**`Question:`**

Given an integer `rowIndex`, return the `rowIndexth` (0-indexed) row of the Pascal's triangle.

In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:

**`Example:`**

![img](https://upload.wikimedia.org/wikipedia/commons/0/0d/PascalTriangleAnimated2.gif)
```
Input: rowIndex = 3
Output: [1,3,3,1]
```

**`Code:`**
```javascript
/**
 * @param {number} rowIndex
 * @return {number[]}
 */
var getRow = function (rowIndex) {
  let triangle = [];
  for (let i = 0; i <= rowIndex; i++) {
    triangle.push([...Array(i + 1).fill(1)]);
  }
  if (rowIndex <= 1) return triangle[rowIndex];
  for (let i = 2; i <= rowIndex; i++) {
    let arr = triangle[i];
    let lastArr = triangle[i - 1];
    for (let j = 1; j < arr.length - 1; j++) {
      arr[j] = lastArr[j] + lastArr[j - 1];
    }
  }
  return triangle[rowIndex];
};
```