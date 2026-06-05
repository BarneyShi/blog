---
title: Leetcode 130 - Surrounded regions
date: 2021-11-12 16:53:10
tags:
- dfs
---
**`Note:`**
- It's really hard to find the `wall` that surrounds some `O`s.
- Instead, any `O`s on the border and `O`s that are connected to them cannot be surrounded by `X`.
- Use `DFS` to start from `O`s on the border and mark all `connected Os`.

**`Question:`**

Given an `m x n` matrix `board` containing `'X'` and `'O'`, capture all regions that are 4-directionally surrounded by `'X'`.

A region is captured by flipping all `'O'`s into `'X'`s in that surrounded region.

**`Example:`**
![img](https://assets.leetcode.com/uploads/2021/02/19/xogrid.jpg)
```
Input: board = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
Output: [["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]]
Explanation: Surrounded regions should not be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.
```

**`Code:`**
```javascript
/**
 * @param {character[][]} board
 * @return {void} Do not return anything, modify board in-place instead.
 */
var solve = function (board) {
  const rows = board.length;
  const cols = board[0].length;

  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      if (i === 0 || j === 0 || i === rows - 1 || j === cols - 1) {
        if (board[i][j] === 'O') dfs(i, j);
      }
    }
  }

  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      if (board[i][j] === '+') {
        board[i][j] = 'O';
      } else {
        board[i][j] = 'X';
      }
    }
  }

  function dfs(i, j) {
    const dirs = [-1, 0, 1, 0, -1];
    if (board[i][j] === 'O') {
      board[i][j] = '+';
    }
    for (let k = 0; k < 4; k++) {
      const nx = i + dirs[k];
      const ny = j + dirs[k + 1];
      if (nx < 0 || ny < 0 || nx === rows || ny === cols || board[nx][ny] !== 'O') continue;
      dfs(nx, ny);
    }
  }
};
```