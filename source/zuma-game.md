---
title: Leetcode 488 - Zuma game
date: 2021-11-08 22:11:25
tags:
- bfs
---
**`Note:`**
- Because of the constraints, we know BFS/DFS is plausible.
- To get the `min` steps, apparently `BFS` is better.
- Need a helper to check `isCleared`, use `stack` to do so.
- BFS need a `queue`, store elements like `[curBoard, ballsLeftForIt]`.
- To avoid repetitive elements, we need a tmp `Set` to store new boards, then add them to `queue`.
- Store candidates in Set as strings. `set.add(newBoard + ',' + ballsLeft);`
- To avoid elements with same `board` but `ballsLeft in different order`, we need to do a `sort` on `ballsLeft`.

**`Question:`**

You are playing a variation of the game Zuma.

In this variation of Zuma, there is a single row of colored balls on a board, where each ball can be colored red 'R', yellow 'Y', blue 'B', green 'G', or white 'W'. You also have several colored balls in your hand.

Your goal is to `clear all` of the balls from the board. On each turn:

- Pick any ball from your hand and insert it in between two balls in the row or on either end of the row.
- If there is a group of `three or more consecutive balls` of the `same color`, remove the group of balls from the board.
  - If this removal causes more groups of three or more of the same color to form, then continue removing each group until there are none left.
- If there are no more balls on the board, then you win the game.
- Repeat this process until you either win or do not have any more balls in your hand.

Given a string `board`, representing the row of balls on the board, and a string `hand`, representing the balls in your hand, return the `minimum` number of balls you have to insert to clear all the balls from the board. If you cannot clear all the balls from the board using the balls in your hand, return `-1`.

**`Example:`**
```
Input: board = "WRRBBW", hand = "RB"
Output: -1
Explanation: It is impossible to clear all the balls. The best you can do is:
- Insert 'R' so the board becomes WRRRBBW. WRRRBBW -> WBBW.
- Insert 'B' so the board becomes WBBBW. WBBBW -> WW.
There are still balls remaining on the board, and you are out of balls to insert.

Constraints:
1 <= board.length <= 16
1 <= hand.length <= 5
```

**`Code:`**
```javascript
/**
 * @param {string} board
 * @param {string} hand
 * @return {number}
 */
 var findMinStep = function(board, hand) {
  return bfs(board, hand);

  function bfs(b, hand) {
    // Need to know what balls in hands have been used.
    let queue = [[b, hand]];
    while (queue.length > 0) {
      let length = queue.length;
      let set = new Set();
      for (let i = 0; i < length; i++) {
        const cur = queue.pop();
        const curBoard = cur[0];
        const curBalls = cur[1];
        if (curBalls.length == 0) continue;
        for (let j = 0; j <= curBoard.length; j++) {
          for (let k = 0; k < curBalls.length; k++) {
            let newBoard = curBoard.slice(0, j) + curBalls[k] + curBoard.slice(j);
            let ballsLeft = curBalls.slice(0, k) + curBalls.slice(k+1);
            if (isCleared(newBoard)) return hand.length - ballsLeft.length;
            ballsLeft = ballsLeft.split('').sort().join('');
            set.add(newBoard + ',' + ballsLeft); 
          }
        }
      }
      let tmp = Array.from(set).map(e => [e.split(',')[0], e.split(',')[1]]);
      queue.push(...tmp);
    }
    return -1;
  }

  function isCleared(p) {
    let stack = [];
    for (let i = 0; i < p.length; i++) {
      if (p[i] === stack[stack.length - 1] && p[i] === stack[stack.length - 2] && p[i+1] !== p[i]) {
        while (stack[stack.length - 1] === p[i]) {
          stack.pop();
        }
      } else {
        stack.push(p[i]);
      }
    }
    return stack.length === 0;
  }
};
```