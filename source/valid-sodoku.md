---
title: Leetcode 36 - Valid sodoku
date: 2021-11-04 23:47:58
tags:
---
**`Note:`**
- Just use brute force way is enough.
- Don't have to iterate once and solve the problem.
- Save some time for other more meaningful things.

**`Question:`**

Determine if a `9 x 9` Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

- Each row must contain the digits `1-9` without repetition.
- Each column must contain the digits `1-9` without repetition.
- Each of the nine 3 x 3 sub-boxes of the grid must contain the digits `1-9` without repetition.

`Note`:

- A Sudoku board (partially filled) could be valid but is not necessarily solvable.
- Only the filled cells need to be validated according to the mentioned rules.

**`Example:`**

![img](https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Sudoku-by-L2G-20050714.svg/250px-Sudoku-by-L2G-20050714.svg.png)
```
Output: true
```

**`Code:`**
```javascript
/**
 * @param {character[][]} board
 * @return {boolean}
 */
var isValidSudoku = function (board) {
  return check3x3() && checkCol() && checkRow();

  function check3x3() {
    let set = new Set();
    let times = 0;
    for (let r = 0; r <= 8; r += 3) {
      for (let c = 0; c <= 8; c += 3) {
        for (let i = r; i <= r + 2; i++) {
          for (let j = c; j <= c + 2; j++) {
            if (!isNaN(board[i][j])) {
              set.add(board[i][j] - 0);
              times++;
            }
          }
        }
        if (times !== set.size) return false;
        times = 0;
        set.clear();
      }
    }
    return set.size === times;
  }
  function checkRow() {
    let set = new Set();
    let times = 0;
    for (let i = 0; i <= 8; i++) {
      for (let j = 0; j <= 8; j++) {
        if (!isNaN(board[i][j])) {
          set.add(board[i][j] - 0);
          times++;
        }
      }
      if (times !== set.size) return false;
      times = 0;
      set.clear();
    }
    return times === set.size;
  }
  function checkCol() {
    let set = new Set();
    let times = 0;
    for (let j = 0; j <= 8; j++) {
      for (let i = 0; i <= 8; i++) {
        if (!isNaN(board[i][j])) {
          set.add(board[i][j] - 0);
          times++;
        }
      }
      if (times !== set.size) return false;
      times = 0;
      set.clear();
    }
    return true;
  }
};
```