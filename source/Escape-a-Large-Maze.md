---
title: Leetcode 1036 - Escape a Large Maze
date: 2022-01-10 17:32:39
tags:
- bfs
---
**`Note:`**
- Normal BFS or DFS will def TLE cuz the grid is just too big.
- Key point: As long as a point is not `besieged` by `blocked[i]`, then it must have a path to `target`.
- If a `souce` is besiged by `blocked` cells, then what would happen?
- The `BFS` would only circulate within that inner area and cannot get out. It would go through every `besieged grid` in that area.
- So, if a `BFS` can go through more than the number of `Max Besieged grids`, then it's def not besieged.
- Here comes the biggest question: `How many grids can block[i] besiged ?`.
- By some math deductions, it's like this: It used the boundaries to form the biggest area.
- ![img](https://i.imgur.com/FPfzko3.png)
- Which is $1 + 2 + 3 + ... + n = \frac{n*(n-1)}{2}$
- We use a `list[]` to contain all visited grids, after BFS ends, if it has more than `n*(n-1)/2` elements, it means it's not trapped.
- Do BFS on both `start -> end` and `end -> start`.

**`Question:`**

There is a `1 million` by `1 million` grid on an XY-plane, and the coordinates of each grid square are (x, y).

We start at the `source` = [sx, sy] square and want to reach the `target` = [tx, ty] square. There is also an array of blocked squares, where each `blocked`[i] = [xi, yi] represents a blocked square with coordinates (xi, yi).

Each move, we can walk one square north, east, south, or west if the square is not in the array of blocked squares. We are also not allowed to walk outside of the grid.

Return true if and only if it is possible to reach the `target` square from the `source` square through a sequence of valid moves.

**`Example:`**
```
Input: blocked = [[0,1],[1,0]], source = [0,0], target = [0,2]
Output: false
Explanation: The target square is inaccessible starting from the source square because we cannot move.
We cannot move north or east because those squares are blocked.
We cannot move south or west because we cannot go outside of the grid.
```

**`Code:`**
```javascript
/**
 * @param {number[][]} blocked
 * @param {number[]} source
 * @param {number[]} target
 * @return {boolean}
 */
var isEscapePossible = function (blocked, source, target) {
  const BOUND = 1000000;
  const DIRS = [-1, 0, 1, 0, -1];
  const MAX = blocked.length * (blocked.length - 1) / 2;
  const block = new Set();
  for (const [x, y] of blocked) {
    block.add(x + '.' + y);
  }
  return bfs(source, target) && bfs(target, source);

  function bfs(start, end) {
    const list = [start];
    let visited = new Set();
    visited.add(start[0] + '.' + start[1]);
    for (let i = 0; i < list.length && list.length <= MAX; i++) {
      for (let k = 0; k < 4; k++) {
        const nx = list[i][0] + DIRS[k];
        const ny = list[i][1] + DIRS[k + 1];
        if (nx < 0 || nx >= BOUND || ny < 0 || ny >= BOUND || block.has(nx + '.' + ny) || visited.has(nx + '.' + ny)) continue;
        if (nx === end[0] && ny === end[1]) return true;
        visited.add(nx + '.' + ny);
        list.push([nx, ny]);
      }
    }
    return list.length > MAX;
  }
};
```