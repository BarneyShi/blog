---
title: Leetcode 2045 - Second Minimum Time to Reach Destination
date: 2022-01-23 18:29:30
tags:
- bfs
---
**`Note:`**
- Find the shortest path/second shortest path always involves `BFS`.
- Apprently, we need to record every vertex's `min` and `second min` path from vertex 1.
- Construct a graph using an array and add every vertex with its neighbour.
- Create another array recording `min` and `second min` dist from `1` to it. Initialized as `INF`.
- Then write a classic BFS template. 
- Note that when we compare `curr dist` with `min` and `second min`, if `curr dist` is bigger than `second min`, there is no need to add `curr vertex` to the queue again because it's sure longer than the second longest path. If we don't do that, we will end up with a loop as well.
- Finally, now we have `path[n][1]` which is the second longest path from `1` to `n`.
- Use a little bit math here, we use a for loop from `0` to `secondMin - 1` to simulate the timelapse, if `t % 2*change < change`, it means we haven't been into the wating time for the signal. If `t % 2*change >= change`, then we have to wait `2 * change - t % 2 * change`.
- ![img](https://i.imgur.com/RigLLzB.png)

**`Question:`**

A city is represented as a bi-directional connected graph with `n` vertices where each vertex is labeled from `1` to `n` (inclusive). The edges in the graph are represented as a 2D integer array `edges`, where each `edges[i] = [ui, vi]` denotes a bi-directional edge between vertex ui and vertex vi. Every vertex pair is connected by at `most one edge`, and no vertex has an edge to itself. The time taken to traverse any edge is `time` minutes.

Each vertex has a traffic signal which changes its color from green to red and vice versa `every change minutes`. All signals change at the same time. You can enter a vertex at any time, but can leave a vertex only when the signal is green. You cannot wait at a vertex if the signal is green.

The `second minimum value` is defined as the smallest value strictly larger than the minimum value.

- For example the second minimum value of [2, 3, 4] is 3, and the second minimum value of [2, 2, 4] is 4.

Given `n`, `edges`, `time`, and `change`, return the second minimum time it will take to go from vertex 1 to vertex n.

Notes:

- You can go through any vertex any number of times, including 1 and n.
- You can assume that when the journey starts, all signals have just turned green.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/09/29/e1.png)
![img](https://assets.leetcode.com/uploads/2021/09/29/e2.png)
```
Input: n = 5, edges = [[1,2],[1,3],[1,4],[3,4],[4,5]], time = 3, change = 5
Output: 13
Explanation:
The figure on the left shows the given graph.
The blue path in the figure on the right is the minimum time path.
The time taken is:
- Start at 1, time elapsed=0
- 1 -> 4: 3 minutes, time elapsed=3
- 4 -> 5: 3 minutes, time elapsed=6
Hence the minimum time needed is 6 minutes.

The red path shows the path to get the second minimum time.
- Start at 1, time elapsed=0
- 1 -> 3: 3 minutes, time elapsed=3
- 3 -> 4: 3 minutes, time elapsed=6
- Wait at 4 for 4 minutes, time elapsed=10
- 4 -> 5: 3 minutes, time elapsed=13
Hence the second minimum time is 13 minutes.     
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @param {number[][]} edges
 * @param {number} time
 * @param {number} change
 * @return {number}
 */
 var secondMinimum = function(n, edges, time, change) {
  const graph = new Array(n + 1).fill(0).map(() => new Array());
  for (const [a, b] of edges) {
    graph[a].push(b);
    graph[b].push(a);
  }
  const path = new Array(n + 1).fill(0).map(() => new Array(2).fill(Number.MAX_SAFE_INTEGER));
  path[1][0] = 0;
  let queue = [1], dist  = 0;

  while (queue.length > 0 && path[n][1] === Number.MAX_SAFE_INTEGER) {
    dist++;
    const length = queue.length;
    let next = new Array();
    for (let i = 0; i < length; i++) {
      const curr = queue[i];
      for (const neighbour of graph[curr]) {
        if (path[neighbour][0] > dist) {
          path[neighbour][0] = dist;
          next.push(neighbour);
        } else if (path[neighbour][0] < dist && path[neighbour][1] > dist) {
          path[neighbour][1] = dist;
          next.push(neighbour);
        }
        if (path[n][1] !== Number.MAX_SAFE_INTEGER) break;
      }
    }
    queue = next;
  }
  let ans = 0;
  for (let i = 0; i < path[n][1]; i++) {
    if (ans % (2 * change) >= change) {
      ans += 2 * change - ans % (2 * change);
    }
    ans += time;
  }
  return ans;
};
```