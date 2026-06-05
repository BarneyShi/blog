---
title: Leetcode 999 - Available captures for rook
date: 2021-11-02 17:40:13
tags:
---
**`Note:`**
- Too easy, just find the position then iterate towards 4 directions

**`Question:`**

On an `8 x 8` chessboard, there is exactly one white rook '`R`' and some number of white bishops '`B`', black pawns '`p`', and empty squares '.'.

When the rook moves, it chooses one of four cardinal directions (north, east, south, or west), then moves in that direction until it chooses to stop, reaches the edge of the board, captures a black pawn, or is blocked by a white bishop. A rook is considered attacking a pawn if the rook can capture the pawn on the rook's turn. The number of available captures for the white rook is the number of pawns that the rook is attacking.

Return the `number of available captures` for the white rook.

**`Example:`**
```
Input: board = 
[
[".",".",".",".",".",".",".","."],
[".",".",".","p",".",".",".","."],
[".",".",".","R",".",".",".","p"],
[".",".",".",".",".",".",".","."],
[".",".",".",".",".",".",".","."],
[".",".",".","p",".",".",".","."],
[".",".",".",".",".",".",".","."],
[".",".",".",".",".",".",".","."]
]
Output: 3
Explanation: In this example, the rook is attacking all the pawns
```

**`Code:`**
```javascript
/**
 * @param {character[][]} board
 * @return {number}
 */
var numRookCaptures = function (board) {
  let rook = [0, 0];
  let result = 0;
  for (let i = 0; i < 8; i++) {
    for (let j = 0; j < 8; j++) {
      if (board[i][j] === 'R') {
        rook = [i, j];
        break;
      }
    }
  }
  for (let i = rook[0]; i >= 0; i--) {
    if (board[i][rook[1]] === 'B') break;
    if (board[i][rook[1]] === 'p') {
      result++;
      break;
    }
  }
  for (let i = rook[0]; i < 8; i++) {
    if (board[i][rook[1]] === 'B') break;
    if (board[i][rook[1]] === 'p') {
      result++;
      break;
    }
  }
  for (let j = rook[1]; j < 8; j++) {
    if (board[rook[0]][j] === 'B') break;
    if (board[rook[0]][j] === 'p') {
      result++;
      break;
    }
  }
  for (let j = rook[1]; j >= 0; j--) {
    if (board[rook[0]][j] === 'B') break;
    if (board[rook[0]][j] === 'p') {
      result++;
      break;
    }
  }
  return result;
};
```