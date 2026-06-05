---
title: Leetcode 59 - Spiral matrix II
date: 2021-08-25 22:37:59
tags:
- array
---
**Note:** 
- Update: 
  - Just pray it won't appear in my interview. Not hard, but a pain in the ass.
- How to initialize an empty `2D` array?
 `const arr = [...Array(n)].map(e => Array(n))`
- Keep `[start, right)` style - make the right boundary open so you won't be lost.
- Speical case for the last node when `n` is `odd`.

Given a positive integer n, generate an n x n matrix filled with elements from 1 to n2 in spiral order.

![img](https://assets.leetcode.com/uploads/2020/11/13/spiraln.jpg)
```
Input: n = 3
Output: [[1,2,3],[8,9,4],[7,6,5]]
```

![img](https://img-blog.csdnimg.cn/2020121623550681.png)

 ```javascript
/**
 * @param {number} n
 * @return {number[][]}
 */
var generateMatrix = function (n) {
  let matrix = [...Array(n)].map(e => Array(n).fill('.'));
  let times = 1;
  let start = [0, 0];
  let rows = n;
  let cols = n;
  while (true) {
    if ((n*n & 1) === 1 && times === n*n || (n*n & 1) === 0 && times === n*n + 1) break;
    for (let j = start[1]; j < cols - 1; j++) {
      matrix[start[0]][j] = times++;
      start[1]++;
    }
    for (let i = start[0]; i < rows - 1; i++) {
      matrix[i][start[1]] = times++;
      start[0]++;;
    }
    for (let j = start[1]; j > n - cols; j--) {
      matrix[start[0]][j] = times++;
      start[1]--;;
    }
    for (let i = start[0]; i > n - rows; i--) {
      matrix[i][start[1]] = times++;
      start[0]--;;
    }
    rows--;
    cols--;
    start[0]++;
    start[1]++;
  }
  if (n*n & 1 === 1) matrix[n>>1][n>>1] = n*n;
  return matrix;
};
 ```
