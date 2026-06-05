---
title: Leetcode 733 - Flood Fill
date: 2021-12-26 02:03:32
tags:
- dfs
---
**`Note:`**
- Classic DFS problem.
- Just remember to use directional arrays to mark 4-direction, and `visited[]`.

**`Question:`**

An image is represented by an `m x n` integer grid `image` where `image[i][j]` represents the pixel value of the image.

You are also given three integers `sr`, `sc`, and `newColor`. You should perform a flood fill on the image starting from the pixel `image[sr][sc]`.

To perform a flood fill, consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color), and so on. Replace the color of all of the aforementioned pixels with `newColor`.

Return the modified `image` after performing the flood fill.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/06/01/flood1-grid.jpg)
```
Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, newColor = 2
Output: [[2,2,2],[2,2,0],[2,0,1]]
Explanation: From the center of the image with position (sr, sc) = (1, 1) (i.e., the red pixel), all pixels connected by a path of the same color as the starting pixel (i.e., the blue pixels) are colored with the new color.
Note the bottom corner is not colored 2, because it is not 4-directionally connected to the starting pixel.
```

**`Code:`**
```javascript
/**
 * @param {number[][]} image
 * @param {number} sr
 * @param {number} sc
 * @param {number} newColor
 * @return {number[][]}
 */
var floodFill = function(image, sr, sc, newColor) {
  const dirs = [-1, 0, 1, 0, -1];
  let visited = {};
  const prevColor = image[sr][sc];
  const rows = image.length;
  const cols = image[0].length;
  dfs(sr, sc);
  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      if (image[i][j] === '') image[i][j] = newColor;
    }
  }
  return image;

  function dfs(i, j) {
    if (visited[i + '.' + j]) return;
    visited[i + '.' + j] = true;
    image[i][j] = '';
    for (let k = 0; k < 4; k++) {
      const nx = i + dirs[k];
      const ny = j + dirs[k + 1];
      if (nx < 0 || nx >= rows || ny < 0 || ny >= cols || image[nx][ny] !== prevColor) continue;
      dfs(nx, ny);
    }
  }
};
```