---
title: Leetcode 2022 - Convert 1D Array Into 2D Array
date: 2021-12-31 15:38:51
tags:
---
**`Note:`**
- Know how to convert `2D` index into `1D`:
  - `[i, j] => i * n + j`. (i*n give us total grids before the curr row then we add j to that).
  - `i * n + j => [floor(i/n), i %n]`.

**`Question:`**

You are given a 0-indexed 1-dimensional (`1D`) integer array `original`, and two integers, m and n. You are tasked with creating a 2-dimensional (`2D`) array with m rows and n columns using all the elements from `original`.

The elements from indices `0` to `n - 1` (inclusive) of `original` should form the first row of the constructed 2D array, the elements from indices n to `2 * n - 1` (inclusive) should form the second row of the constructed 2D array, and so on.

Return an `m x n` 2D array constructed according to the above procedure, or an empty 2D array if it is impossible.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/08/26/image-20210826114243-1.png)
```
Input: original = [1,2,3,4], m = 2, n = 2
Output: [[1,2],[3,4]]
Explanation: The constructed 2D array should contain 2 rows and 2 columns.
The first group of n=2 elements in original, [1,2], becomes the first row in the constructed 2D array.
The second group of n=2 elements in original, [3,4], becomes the second row in the constructed 2D array.
```

**`Code:`**
```javascript
/**
 * @param {number[]} original
 * @param {number} m
 * @param {number} n
 * @return {number[][]}
 */
var construct2DArray = function(original, m, n) {
  if (m * n < original.length || m * n > original.length) return [];
  let ans = [...new Array(m)].map(e => [...new Array(n).fill(0)]);
  for (let i = 0; i < original.length; i++) {
    ans[~~(i / n)][i % n] = original[i];
  }
  return ans;
};
```