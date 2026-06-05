---
title: Leetcode 210 - Course schedule II
date: 2021-10-24 23:05:04
tags:
- bfs
- topological sort
---
**`Note:`**
![img](https://i.imgur.com/vPFuhdP.png)
- Build `map` to store edges, `crs => [prevArr]`.
- Build `indegree` for every node.
- Build a `queue` to store whose `indegree == 0`.
- Keep iterating until queue.length === 0. And decrement the first node of queue's indegree by 1. If it becomes `0`, add it to queue. Then, add cur node to the front of `result`.
- If all indegree is 0, then return result. Otherwise, return [];

**`Question:`**

There are a total of `numCourses` courses you have to take, labeled from `0` to `numCourses - 1`. You are given an array prerequisites where `prerequisites[i] = [ai, bi]` indicates that you must take course `bi` first if you want to take course `ai`.

- For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.

Return the ordering of courses you should take to finish all courses. If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.

**`Example:`**
```
Input: numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]
Output: [0,2,1,3]
Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0.
So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3].
```

**`Code:`**
```javascript
/**
 * @param {number} numCourses
 * @param {number[][]} prerequisites
 * @return {number[]}
 */
var findOrder = function(numCourses, prerequisites) {
  let queue = [];
  let result = [];
  let map = new Map();
  let indegree = [...Array(numCourses).fill(0)];
  for (const [crs, pre] of prerequisites) {
    if (!map.has(crs)) {
      map.set(crs, [pre]);
    } else {
      map.set(crs, [...map.get(crs), pre]);
    }
    indegree[pre]++;
  }
  indegree.forEach((e, i) => {
    if (e === 0) queue.push(i);
  })

  while (queue.length > 0) {
    const cur = queue.shift();
    result.unshift(cur);
    if (map.has(cur)) {  
      for (const crs of map.get(cur)) {
        indegree[crs]--;
        if (indegree[crs] === 0) queue.push(crs);
      }
    }
  }
  if (indegree.some(e => e !== 0)) return [];
  return result;
};
```