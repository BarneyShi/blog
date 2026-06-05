---
title: Leetcode 79 - Word search
date: 2021-11-10 00:57:00
tags:
- dfs
- backtracking
---
**`Note:`**
- Update:
  - Use only `DFS` is not enough, because from one point, we can go multiple ways,
  what if one way is not correct, but the other is correct? We must return from the wrong way, and redirect to the correct way. Hence `backtracking`.
- This is a `DFS + backtracking` problem.
- Intialize `path` with `path[word[0]]`.
- Call `dfs()` from `board[i][j] = word[0]`.
- Use `used[][]` to mark elements that have been visited.
- Use `directional array` to get `4 directions`.

**`Question:`**

Given an `m x n` grid of characters `board` and a string `word`, return `true` if word exists in the grid.

The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/11/04/word2.jpg)
```
Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
Output: true
```

**`Code:`**
```javascript
/**
 * @param {character[][]} board
 * @param {string} word
 * @return {boolean}
 */
var exist = function (board, word) {
  const rows = board.length;
  const cols = board[0].length;
  const directions = [-1, 0, 1, 0, -1];
  let path = [];
  let used = [...new Array(rows)].map(e => new Array(cols).fill(false));
  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      if (word[0] === board[i][j]) {
        used[i][j] = true;
        if (dfs(i, j, 1)) return true;
        used[i][j] = false;
      }
    }
  }
  return false;

  function dfs(i, j, wordIndex) {
    if (wordIndex === word.length) return true;
    if (i >= rows || j >= cols || i < 0 || j < 0) {
      return false;
    };
    for (let k = 0; k < 4; k++) {
      const nx = i + directions[k];
      const ny = j + directions[k + 1];
      if (nx < 0 || nx >= rows || ny < 0 || ny >= cols || used[nx][ny] || board[nx][ny] !== word[wordIndex]) continue;
      path.push(board[i][j]);
      used[i][j] = true;
      if (dfs(nx, ny, wordIndex + 1)) return true;
      path.pop();
      used[i][j] = false;
    }
    return false;
  }
};
```