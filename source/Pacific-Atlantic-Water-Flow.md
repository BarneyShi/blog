---
title: Leetcode 417 - Pacific Atlantic Water Flow
date: 2021-12-17 23:18:26
tags:
- dfs
- backtracking
---
**`Note:`**
- We have to use `backtracking`. Image you found an ocean following a path, but we are not sure if there is another branch to the other ocean on the path. So we need backtracking.
- Base case: visited[] returns `[true, true]`. Note that if `visited[]` returns something like `[true, false]`, it doesn't necessarily mean that from `[i, j]` you cannot flow to both `oceans`.
- Use `visited[]` to remember results we've got.
- Use `path` so we won't repeat.

**`Question:`**

There is an `m x n` rectangular island that borders both the Pacific Ocean and Atlantic Ocean. The Pacific Ocean touches the island's left and top edges, and the Atlantic Ocean touches the island's right and bottom edges.

The island is partitioned into a grid of square cells. You are given an `m x n` integer matrix `heights` where heights[r][c] represents the height above sea level of the cell at coordinate `(r, c)`.

The island receives a lot of rain, and the rain water can flow to neighboring cells directly north, south, east, and west if the neighboring cell's height is less than or equal to the current cell's height. Water can flow from any cell adjacent to an ocean into the ocean.

Return a 2D list of grid coordinates `result` where `result[i] = [ri, ci]` denotes that rain water can flow from cell `(ri, ci)` to both the Pacific and Atlantic oceans.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/06/08/waterflow-grid.jpg)
```
Input: heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]
Output: [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]
```

**`Code:`**
```javascript
/**
 * @param {number[][]} heights
 * @return {number[][]}
 */
 var pacificAtlantic = function(heights) {
  const rows = heights.length;
  const cols = heights[0].length;
  const dirs = [-1, 0, 1, 0, -1];
  let visited = {};
  let path = new Set();
  let result = [];
  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      const res = dfs(i, j);
      if (res[0] && res[1]) result.push([i, j]);
    }
  }
  return result;

  function dfs(i, j) {
    if (visited[i + '.' + j] !== undefined && visited[i + '.' + j][0] && visited[i + '.' + j][1]) return visited[i + '.' + j]
    let ans = [false, false];
    if (i === 0 || j === 0) ans[0] = true;
    if (i === rows - 1 || j === cols - 1) ans[1] = true;
    path.add(i + '.' + j);
    for (let k = 0; k < 4; k++) {
      const nx = i + dirs[k];
      const ny = j + dirs[k + 1];
      if (nx < 0 || nx >= rows || ny < 0 || ny >= cols || heights[nx][ny] > heights[i][j] || path.has(nx + '.' + ny)) continue;
      const res = dfs(nx, ny);
      ans[0] = ans[0] || res[0];
      ans[1] = ans[1] || res[1];
    }
    path.delete(i + '.' + j);
    visited[i + '.' + j] = ans;
    return ans;
  }
};
```