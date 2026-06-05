---
title: Leetcode 419 - Battleships in a Board
date: 2021-12-17 16:03:11
tags:
- dfs
---
**`Note:`**
- I misunderstood the description. It actually says that all battleships on the given board are `1 x k` or `k x 1`, and it doesn't mean that we need to find those single `row`/`col` ourselves.
- So instead of `dfs`, just count the start of each battleship.

**`Question:`**

Given an `m x n` matrix `board` where each cell is a battleship `'X'` or empty `'.'`, return the number of the battleships on `board`.

Battleships can only be placed horizontally or vertically on `board`. In other words, they can only be made of the shape `1 x k` (1 row, k columns) or `k x 1` (k rows, 1 column), where k can be of any size. At least one horizontal or vertical cell separates between two battleships (i.e., there are no adjacent battleships).

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/04/10/battelship-grid.jpg)
```
Input: board = [["X",".",".","X"],[".",".",".","X"],[".",".",".","X"]]
Output: 2
```

**`Code:`**

**Over complicated DFS O(mn) with O(mn) space**
```javascript
/**
 * @param {character[][]} board
 * @return {number}
 */
var countBattleships = function(board) {
  const rows = board.length;
  const cols = board[0].length;
  let visited = {};
  const dirs = [-1, 0, 1, 0, -1];
  let ans = 0;
  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      if (board[i][j] === 'X') ans += dfs(i, j, i, j);
    }
  }
  return ans;

  function dfs(lastI, lastJ, i, j) {
    if (visited[i + '.' + j]) return 0;
    visited[i + '.' + j] = true;
    let ans = 0;
    let hasNext = false;
    for (let k = 0; k < 4; k++) {
      const nx = i + dirs[k];
      const ny = j + dirs[k + 1];
      if (nx < 0 || nx >= rows || ny < 0 || ny >= cols || visited[nx + '.' + ny]) continue;
      if (board[nx][ny] === 'X' && nx !== lastI && ny !== lastJ) return 0;
      if (board[nx][ny] === 'X') {
        hasNext = !hasNext;
        ans += dfs(i, j, nx, ny);
      }
    }
    if (!hasNext) return 1;
    return ans;
  }
};
```

**O(mn) with O(1) space**
```javascript
/**
 * @param {character[][]} board
 * @return {number}
 */
var countBattleships = function(board) {
  const rows = board.length;
  const cols = board[0].length;
  let ans = 0;
  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      if (board[i][j] === 'X') {
        if (i > 0 && board[i - 1][j] === 'X') continue;
        if (j > 0 && board[i][j - 1] === 'X') continue;
        ans++;
      }
    }
  }
  return ans;
};
``` 