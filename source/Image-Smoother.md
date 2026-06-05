---
title: Leetcode 661 - Image Smoother
date: 2021-12-14 21:52:58
tags:
---
**`Note:`**
- Ezpz
- Use dirs to make code shorter.

**`Question:`**

An `image smoother` is a filter of the size `3 x 3` that can be applied to each cell of an image by rounding down the average of the cell and the eight surrounding cells (i.e., the average of the nine cells in the blue smoother). If one or more of the surrounding cells of a cell is not present, we do not consider it in the average (i.e., the average of the four cells in the red smoother).

![img](https://assets.leetcode.com/uploads/2021/05/03/smoother-grid.jpg)

Given an `m x n` integer matrix `img` representing the grayscale of an image, return the image after applying the smoother on each cell of it.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/05/03/smooth-grid.jpg)
```
Input: img = [[1,1,1],[1,0,1],[1,1,1]]
Output: [[0,0,0],[0,0,0],[0,0,0]]
Explanation:
For the points (0,0), (0,2), (2,0), (2,2): floor(3/4) = floor(0.75) = 0
For the points (0,1), (1,0), (1,2), (2,1): floor(5/6) = floor(0.83333333) = 0
For the point (1,1): floor(8/9) = floor(0.88888889) = 0
```

**`Code:`**
```javascript
/**
 * @param {number[][]} img
 * @return {number[][]}
 */
var imageSmoother = function(img) {
  const rows = img.length;
  const cols = img[0].length;
  let ans = [...new Array(rows)].map(e => new Array(cols).fill(0));
  const dirs = [[-1,-1], [-1,0], [-1,1], [0,-1], [0,0], [0,1], [1,-1], [1,0], [1,1]];
  
  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      let sum = 0;
      let count = 0;
      for (let k = 0; k < dirs.length; k++) {
        if (i + dirs[k][0] < 0 || i + dirs[k][0] >= rows | j + dirs[k][1] < 0 || j + dirs[k][1] >= cols) continue;
        const curr = img[i + dirs[k][0]][j + dirs[k][1]];
        sum += curr;
        count++;
      }
      ans[i][j] = Math.floor(sum / count);
    }
  }
  return ans;
};
```