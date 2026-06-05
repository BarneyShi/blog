---
title: Leetcode 200 - Number of islands
date: 2021-11-15 01:43:37
tags:
- dfs
---
**`Note:`**
- `DFS` question.
- Use `visited[][]` to mark all visited `1`.
- Every time we encounter a `1`, res++;

**`Question:`**

Given an `m x n` 2D binary grid `grid` which represents a map of '`1`'s (`land`) and '`0`'s (`water`), return the number of islands.

An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

**`Example:`**
```
Input: grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
Output: 3
```

**`Code:`**
```javascript
/**
 * @param {character[][]} grid
 * @return {number}
 */
var numIslands = function(grid) {
  let res = 0;
  const rows = grid.length;
  const cols = grid[0].length;
  let visited = [...Array(rows)].map(e => Array(cols).fill(false));
  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      if (grid[i][j] === '1' && !visited[i][j]) {
        res++;
        dfs(grid, i, j);
      }
    }
  }
  return res;

  function dfs(grid, i, j) {
    if (visited[i][j]) return;
    const dirs = [-1,0,1,0,-1];
    visited[i][j] = true;
    for (let k = 0; k < 4; k++) {
      const nx = i + dirs[k];
      const ny = j + dirs[k + 1];
      if (nx < 0 || nx >= rows || ny < 0 || ny >= cols) continue;
      if (grid[nx][ny] === '0') continue;
      dfs(grid, nx, ny);
    }
  }
};
```