---
title: Leetcode 463 - Island perimeter
date: 2021-11-18 17:39:24
tags:
---
**`Note:`**
- Use `dirs` to get adjacent cells.
- Set `edge = 4`;
- If the connect cell is land, `edges--`;
- Add edges to `res` per iteration.

**`Question:`**

You are given `row x col` `grid` representing a map where `grid[i][j] = 1` `represents land` and `grid[i][j] = 0` represents `water`.

Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).

The island doesn't have "lakes", meaning the water inside isn't connected to the water around the island. One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.

**`Example:`**
![img](https://assets.leetcode.com/uploads/2018/10/12/island.png)
```
Input: grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
Output: 16
Explanation: The perimeter is the 16 yellow stripes in the image above.
```

**`Code:`**
```javascript
/**
 * @param {number[][]} grid
 * @return {number}
 */
var islandPerimeter = function(grid) {
  const dirs = [-1, 0, 1, 0, -1];
  const rows = grid.length;
  const cols = grid[0].length;
  let res = 0;
  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      if (grid[i][j] === 0) continue;
      let edges = 4;
      for (let k = 0; k < 4; k++) {
        const nx = i + dirs[k];
        const ny = j + dirs[k + 1];
        if (nx < 0 || nx >= rows || ny < 0 || ny >= cols) continue;
        if (grid[nx][ny] === 1) edges--;
      }
      res += edges;
    }
  }
  return res;
};
```