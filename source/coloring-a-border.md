---
title: Leetcode 1034 - Coloring a border
date: 2021-12-06 23:06:25
tags:
- dfs
---
**`Note:`**
- Use `DFS` with `visited[][]`.
- Mark cells that should be colored as `[color, oldColor]`.
- Mark all `first row`, `last row`, `first col`, `last col`.
- Mark cells whose neighbor has different `val` and it's not an array.
- After `DFS`, convert `[color, oldColor]` into `color`.

**`Question:`**

You are given an `m x n` integer matrix grid, and three integers `row`, `col`, and `color`. Each value in the grid represents the color of the grid square at that location.

Two squares belong to the same `connected component` if they have the same color and are next to each other in any of the 4 directions.

The `border of a connected component` is all the squares in the connected component that are either 4-directionally adjacent to a square not in the component, or on the boundary of the grid (the first or last row or column).

You should color the border of the connected component that contains the square `grid[row][col]` with `color`.

Return the final `grid`.

**`Example:`**
```
Input: grid = [[1,1],[1,2]], row = 0, col = 0, color = 3
Output: [[3,3],[3,2]]
```

**`Code:`**
```javascript
/**
 * @param {number[][]} grid
 * @param {number} row
 * @param {number} col
 * @param {number} color
 * @return {number[][]}
 */
 var colorBorder = function(grid, row, col, color) {
  const oldColor = grid[row][col];
  const rows = grid.length;
  const cols = grid[0].length;
  const dirs = [-1,0,1,0,-1];
  const visited = [...Array(rows)].map(e => Array(cols).fill(false));
  dfs(row, col);

  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      if (isNaN(grid[i][j])) grid[i][j] = grid[i][j][0];
    }
  }
  return grid;

  function dfs(i, j) {
    if (grid[i][j] !== oldColor) return;
    visited[i][j] = true;
    if (i === 0 || i === rows - 1 || j === 0 || j === cols - 1) {
      grid[i][j] = [color, grid[i][j]];
    }
    for (let k = 0; k < 4; k++) {
      const nx = i + dirs[k];
      const ny = j + dirs[k + 1];
      if (nx < 0 || nx >= rows || ny < 0 || ny >= cols || visited[nx][ny]) continue;
      if (!isNaN(grid[nx][ny]) && grid[nx][ny] !== oldColor) grid[i][j] = [color, grid[i][j]];
      dfs(nx, ny);
    }
  }
};

```