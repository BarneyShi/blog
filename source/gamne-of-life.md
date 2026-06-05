---
title: Leetcode 289 - Gamne of life
date: 2021-10-31 22:19:12
tags:
- array
---
**`Note:`**
- To finish with `O(1)` extra space, we need another 2 states.
- `2` means `1` became `0`.
- `-1` means `0` became `1`.
- After the first iteration, do another iteration to change `2` to `0`, and `-1` to `1`.

**`Question:`**

According to Wikipedia's article: "The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970."

The board is made up of an m x n grid of cells, where each cell has an initial state: live (represented by a 1) or dead (represented by a 0). Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using the following four rules (taken from the above Wikipedia article):

1. Any live cell with fewer than two live neighbors dies as if caused by under-population.
2. Any live cell with two or three live neighbors lives on to the next generation.
3. Any live cell with more than three live neighbors dies, as if by over-population.
4. Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.

The next state is created by applying the above rules simultaneously to every cell in the current state, where births and deaths occur simultaneously. Given the current state of the `m x n` grid `board`, return the next state.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/12/26/grid1.jpg)
```
Input: board = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]
Output: [[0,0,0],[1,0,1],[0,1,1],[0,1,0]]
```

**`Code:`**
```javascript
/**
 * @param {number[][]} board
 * @return {void} Do not return anything, modify board in-place instead.
 */
 var gameOfLife = function (board) {
  const rows = board.length;
  const cols = board[0].length;
  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      let count = 0;
      i > 0 && (board[i - 1][j] === 1 || board[i - 1][j] === 2) && (count++);
      i < rows - 1 && (board[i + 1][j] === 1 || board[i + 1][j] === 2) && (count++);
      j < cols - 1 && (board[i][j + 1] === 1 || board[i][j + 1] === 2) && (count++);
      j > 0 && (board[i][j - 1] === 1 || board[i][j - 1] === 2) && (count++);
      i > 0 && j < cols - 1 && (board[i - 1][j + 1] === 1 || board[i - 1][j + 1] === 2) && (count++);
      i > 0 && j > 0 && (board[i - 1][j - 1] === 1 || board[i - 1][j - 1] === 2) && (count++);
      i < rows - 1 && j > 0 && (board[i + 1][j - 1] === 1 || board[i + 1][j - 1] === 1) && (count++);
      i < rows - 1 && j < cols - 1 && (board[i + 1][j + 1] === 1 || board[i + 1][j + 1] === 2) && (count++);
      if (board[i][j] === 0) {
        if (count === 3) board[i][j] = -1;
      } else {
        if (count < 2 || count > 3) board[i][j] = 2;
      }
    }
  }
  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      if (board[i][j] === -1) {
        board[i][j] = 1;
      } else if (board[i][j] === 2) {
        board[i][j] = 0;
      }
    }
  }
  return board;
};
```