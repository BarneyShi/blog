---
title: Leetcode 794 - Valid Tic-Tac-Toe State
date: 2021-12-08 19:44:34
tags:
- simulation
---
**`Note:`**
- Don't use `DFS` coz `X` or `O` is not to be placed along some path. It can be just random.
- Find out the pattern!
- If Both `X` and `O` win, it's `false`.
- If there are more `O`s than `X`s, it's `false`.
- If `X` wins but there are same number of `X`s and `O`s, it's false.
- Likewise, if `O` wins but there are more `X`s than `O`s, it's false. 

**`Question:`**

Given a Tic-Tac-Toe board as a string array `board`, return `true` if and only if it is possible to reach this board position during the course of a valid tic-tac-toe game.

The board is a `3 x 3` array that consists of characters `' '`, `'X'`, and `'O'`. The ' ' character represents an `empty` square.

Here are the rules of Tic-Tac-Toe:

- Players take turns placing characters into empty squares ' '.
- The first player always places 'X' characters, while the second player always places 'O' characters.
- 'X' and 'O' characters are always placed into empty squares, never filled ones.
- The game ends when there are three of the same (non-empty) character filling any row, column, or diagonal.
- The game also ends if all squares are non-empty.
- No more moves can be played if the game is over.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/05/15/tictactoe1-grid.jpg)
```
Input: board = ["O  ","   ","   "]
Output: false
Explanation: The first player always plays "X".
```

**`Code:`**
```javascript
/**
 * @param {string[]} board
 * @return {boolean}
 */
 var validTicTacToe = function(board) {
  let xCount = 0, oCount = 0;
  let xPos = [], oPos = [];
  for (let i = 0; i < 3; i++) {
    for (let j = 0; j < 3; j++) {
      if (board[i][j] === 'X') {
        xCount++;
        xPos.push([i, j]);
      }
      if (board[i][j] === 'O') {
        oCount++;
        oPos.push([i, j]);
      }
    }
  }
  if (oCount - xCount >= 1) return false;
  if (Math.abs(xCount - oCount) > 1) return false;
  let isXWin = false, isOWin = false;
  ifBothWins(board);
  const isBothWin = isXWin && isOWin;
  if (isBothWin) return false;
  if (isXWin && xCount === oCount) return false;
  if (isOWin && xCount !== oCount) return false;
  return true;

  function ifBothWins(grid) {
    for (let i = 0; i < 3; i++) {
      if (grid[i] === 'XXX' || (grid[0][i] + grid[1][i] + grid[2][i] === 'XXX')) isXWin = true;;
      if (grid[i] === 'OOO' || (grid[0][i] + grid[1][i] + grid[2][i] === 'OOO')) isOWin = true;
    }
    if (grid[0][0] + grid[1][1] + grid[2][2] === 'XXX' || grid[0][2] + grid[1][1] + grid[2][0] === 'XXX') isXWin = true;
    if (grid[0][0] + grid[1][1] + grid[2][2] === 'OOO' || grid[0][2] + grid[1][1] + grid[2][0] === 'OOO') isOWin = true;
  }
};
```