---
title: Leetcode 529 - Minesweeper
date: 2022-01-08 16:35:51
tags:
- dfs
---
**`Note:`**
- Classic DFS problem.
- Remember to do on all `8` directions instead of 4.

**`Question:`**

Let's play the minesweeper game (Wikipedia, online game)!

You are given an m x n char matrix board representing the game board where:

- '`M`' represents an unrevealed mine,
- '`E`' represents an unrevealed empty square,
- '`B`' represents a revealed blank square that has no adjacent mines (i.e., above, below, left, right, and all 4 diagonals),
- digit ('1' to '8') represents how many mines are adjacent to this revealed square, and
- '`X`' represents a revealed mine.

You are also given an integer array click where `click = [clickr, clickc]` represents the next click position among all the unrevealed squares ('M' or 'E').

Return the board after revealing this position according to the following rules:

1.  If a mine 'M' is revealed, then the game is over. You should change it to 'X'.
2.  If an empty square 'E' with no adjacent mines is revealed, then change it to a revealed blank 'B' and all of its adjacent unrevealed squares should be revealed recursively.
3.  If an empty square 'E' with at least one adjacent mine is revealed, then change it to a digit ('1' to '8') representing the number of adjacent mines.
4.  Return the board when no more squares will be revealed.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2018/10/12/minesweeper_example_1.png)
```
Input: board = [["E","E","E","E","E"],["E","E","M","E","E"],["E","E","E","E","E"],["E","E","E","E","E"]], click = [3,0]
Output: [["B","1","E","1","B"],["B","1","M","1","B"],["B","1","1","1","B"],["B","B","B","B","B"]]
```

**`Code:`**
```javascript
/**
 * @param {character[][]} board
 * @param {number[]} click
 * @return {character[][]}
 */
var updateBoard = function (board, click) {
  const rows = board.length;
  const cols = board[0].length;
  let visited = new Set();
  let isGameOver = false;
  const dirs = [[-1, -1], [1, -1], [-1, 1], [1, 1], [1, 0], [0, 1], [-1, 0], [0, -1]];
  dfs(click[0], click[1], board);
  return board;

  function dfs(i, j, board) {
    if (isGameOver) return;
    if (visited.has(i + '.' + j)) return;
    if (board[i][j] === 'M') {
      isGameOver = true;
      board[i][j] = 'X';
      return;
    }
    visited.add(i + '.' + j);
    let mineCount = 0;
    for (let k = 0; k < 8; k++) {
      const nx = i + dirs[k][0];
      const ny = j + dirs[k][1];
      if (nx < 0 || ny < 0 || nx >= rows || ny >= cols) continue;
      if (board[nx][ny] === 'M') {
        mineCount++;
      }
    }
    if (mineCount > 0) {
      board[i][j] = mineCount.toString();
      return;
    } else {
      board[i][j] = 'B';
      for (let k = 0; k < 8; k++) {
        const nx = i + dirs[k][0];
        const ny = j + dirs[k][1];
        if (nx < 0 || ny < 0 || nx >= rows || ny >= cols) continue;
        dfs(nx, ny, board);
      }
    }
  }
};
```