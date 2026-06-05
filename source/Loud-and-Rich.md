---
title: Leetcode 851 - Loud and Rich
date: 2021-12-14 19:47:43
tags:
- topological sort
- bfs
- dfs
---
**`Note:`**
- `Topological BFS:`
  - Looks at the input, it's quite like the `course schedule` problem I did. Using `indegree` gives us access to traverse the graph.
  - Be careful of the direction of edges. It has to point from `richer` to `poorer` because in `ans`, the richest people have their own as the answer.
  - Construct a `map` for `edges`, and initialize `queue` with vertexes whose `indegree === 0`.
  - While iterating, update `queue` with `vertex` whose `indegree` becomes `0`.
- `DFS:`
  - DFS was my first intuition but I didn't think it thorough. (sad)
  - Use `ans[]` to memo answers.
  - Use `map` to construct `edges` from `poor` to `rich`.
  - Do DFS toward every possible edges. 
  - Return ans when `ans[i]` is not -1.
  - For richest people, return themselves.

**`Question:`**

There is a group of `n` people labeled from `0` to `n - 1` where each person has a different amount of money and a different level of quietness.

You are given an array `richer` where `richer[i] = [ai, bi]` indicates that `ai` has more money than `bi` and an integer array `quiet` where `quiet[i]` is the quietness of the `ith` person. All the given data in richer are logically correct (i.e., the data will not lead you to a situation where `x` is richer than `y` and `y` is richer than `x` at the same time).

Return an integer array `answer` where `answer[x] = y` if `y` is the least quiet person (that is, the person y with the smallest value of `quiet[y]`) among all people who definitely have equal to or more money than the person x.

**`Example:`**
```
Input: richer = [[1,0],[2,1],[3,1],[3,7],[4,3],[5,3],[6,3]], quiet = [3,2,5,4,6,1,7,0]
Output: [5,5,2,5,4,5,6,7]
Explanation: 
answer[0] = 5.
Person 5 has more money than 3, which has more money than 1, which has more money than 0.
The only person who is quieter (has lower quiet[x]) is person 7, but it is not clear if they have more money than person 0.
answer[7] = 7.
Among all people that definitely have equal to or more money than person 7 (which could be persons 3, 4, 5, 6, or 7), the person who is the quietest (has lower quiet[x]) is person 7.
The other answers can be filled out with similar reasoning.
```

**`Code:`**

**`Topological sort`**
```javascript
/**
 * @param {number[][]} richer
 * @param {number[]} quiet
 * @return {number[]}
 */
var loudAndRich = function(richer, quiet) {
  let ans = [...Array(quiet.length)].map((e, i) => i);
  let queue = [];
  let indegree = [...Array(quiet.length).fill(0)];
  let map = new Map();
  for (const [b, a] of richer) {
    indegree[a]++;
    if (!map.has(b)) {
      map.set(b, [a]);
    } else {
      map.set(b, [...map.get(b), a]);
    }
  }
  for (const [i, d] of indegree.entries()) {
    if (d === 0) {
      queue.push(i);
      ans[i] = i;
    }
  }
  while (queue.length > 0) {
    const length = queue.length;
    for (let i = 0; i < length; i++) {
      const head = queue.shift();
      const next = map.get(head);
      if (next) {
        for (const edge of next) {
          indegree[edge]--;
          ans[edge] = (quiet[ans[edge]] < quiet[ans[head]]) ? ans[edge] : ans[head];
          if (indegree[edge] === 0)  {
            queue.push(edge);
          }
        }
      }
    }
  }
  return ans;
};
```
**`DFS`**
```javascript
/**
 * @param {number[][]} richer
 * @param {number[]} quiet
 * @return {number[]}
 */
var loudAndRich = function(richer, quiet) {
  let ans = [...Array(quiet.length).fill(-1)];
  let map = new Map();
  for (const [a, b] of richer) {
    if (!map.has(b)) {
      map.set(b, [a]);
    } else {
      map.set(b, [...map.get(b), a]);
    }
  }
  for (let i = 0; i < quiet.length; i++) {
    dfs(i);
  }
  return ans;

  function dfs(start) {
    if (ans[start] !== -1) return ans[start];
    ans[start] = start;
    if (!map.has(start)) return;
    for (const neighbor of map.get(start)) {
      dfs(neighbor);
      if (quiet[ans[neighbor]] < quiet[ans[start]]) {
        ans[start] = ans[neighbor];
      }
    }
  }
};
```