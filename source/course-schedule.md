---
title: Leetcode 207 - Course schedule
date: 2021-10-23 04:04:18
tags:
- topological sort
- dfs
---
**`Note:`**
![img](https://i.imgur.com/9Dv5tx0.png)
- **`DFS`** (To detect circles)
  - 1. Build an adjacent edge list using Map. Course as `key`, prerequisite as `val`.
  - 2. Create a `set` to store `visited` node.
  - 3. For each course in `numberCourse`, check if there is a `pre`, if yes, do `DFS` search on every `pre` and pres' `pre`.
  - 4. Base case: `map.get(crs)` is empty then return true. If it has been visited, it means there is a cycle, and we return `false`.
  - 5. Remove node from `visited` set, and clear `preMap[crs]` afterwards.
  - 6. Because return type is `bool`, we need to return `bool` in dfs.
- **`BFS`**
  - Build `adjacency` map to store edges.
  - Build `indegree` array to store indegree of every node.
  - Push node with `indegree = 0` to `queue`.
  - Iterate when `queue` is not empty, and make all ajacent node `indegree--`, and add them to `queue` if their indegrees become `0` after the operations.
  - Check if every element in `indegree` is `0`.

**`Question:`**

There are a total of `numCourses` courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where `prerequisites[i] = [ai, bi]` indicates that you must take course bi first if you want to take course ai.

- For example, the pair `[0, 1]`, indicates that to take course 0 you have to first take course 1.
Return `true` if you can finish all courses. Otherwise, return `false`.

**`Example:`**
```
Input: numCourses = 2, prerequisites = [[1,0]]
Output: true
Explanation: There are a total of 2 courses to take. 
To take course 1 you should have finished course 0. So it is possible.
```

**`Code:`**
```javascript
/**
 * @param {number} numCourses
 * @param {number[][]} prerequisites
 * @return {boolean}
 */
var canFinish = function (numCourses, prerequisites) {
  let preMap = new Map();
  let visited = new Set();
  for (const [course, pre] of prerequisites) {
    if (!preMap.has(course)) {
      preMap.set(course, [pre]);
    } else {
      preMap.set(course, [...preMap.get(course), pre]);
    }
  }

  for (let course of Array.from(Array(numCourses).keys())) {
    if (!dfs(course)) return false;
  }
  return true;

  function dfs(course) {
    if (visited.has(course)) return false;
    if (!preMap.has(course) || preMap.get(course).length === 0) return true;
    visited.add(course);

    for (let pre of preMap.get(course)) {
      if (!dfs(pre)) return false;
    }
    visited.delete(course);
    preMap.set(course, []);
    return true;
  }

};
```