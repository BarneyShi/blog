---
title: Leetcode 399 - Evaluate Division
date: 2021-12-15 23:40:32
tags:
- dfs
- union find
---
**`Note:`**
- `DFS`
  - Use `map` to construct a graph. Note that for every `[a, b]`, `[b, a]` should also be added.
  - Use `valMap` to store vals.
  - Based case of DFS: `map` doesn't have `curr` OR `curr` has been visited before. Return `-1`.
  - Params : 
    - `curr`
    - `dest` known from query
    - `product` contains result (Next product should be `product * valmap.get(curr + '.' + neighbor)`).
  - While result from `dfs()` is not `-1`, return it. Otherwise return -1.

**`Question:`**

You are given an array of variable pairs `equations` and an array of real numbers `values`, where `equations[i] = [Ai, Bi]` and `values[i]` represent the equation `Ai / Bi = values[i]`. Each `Ai` or `Bi` is a string that represents a single variable.

You are also given some `queries`, where `queries[j] = [Cj, Dj]` represents the `jth` query where you must find the answer for `Cj / Dj = ?`.

Return the answers to all queries. If a single answer cannot be determined, return `-1.0`.

Note: The input is always `valid`. You may assume that evaluating the queries will not result in division by zero and that there is no contradiction.

**`Example:`**
```
Input: equations = [["a","b"],["b","c"]], values = [2.0,3.0], queries = [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]
Output: [6.00000,0.50000,-1.00000,1.00000,-1.00000]
Explanation: 
Given: a / b = 2.0, b / c = 3.0
queries are: a / c = ?, b / a = ?, a / e = ?, a / a = ?, x / x = ?
return: [6.0, 0.5, -1.0, 1.0, -1.0 ]
```

**`Code:`**
```javascript
/**
 * @param {string[][]} equations
 * @param {number[]} values
 * @param {string[][]} queries
 * @return {number[]}
 */
var calcEquation = function(equations, values, queries) {
  let ans = [...new Array(queries.length)];
  let map = new Map();
  let valMap = new Map();

  for (let i = 0; i < equations.length; i++) {
    const [a, b] = equations[i];
    const val = values[i];
    if (!map.has(a)) {
      map.set(a, [b]);
    } else {
      map.set(a, [...map.get(a), b]);
    }
    if (!map.has(b)) {
      map.set(b, [a]);
    } else {
      map.set(b, [...map.get(b), a]);
    }
    valMap.set(a + '.' + b, val);
    valMap.set(b + '.' + a, 1 / val);
  }

  for (const [i, [x, y]] of queries.entries()) {
    const set = new Set();
    const v = dfs(x, y, 1, set);
    ans[i] = v;
  }
  return ans;

  function dfs(start, dest, product, visited) {
    if (!map.has(start) || visited.has(start)) return -1;
    const neightbors = map.get(start);
    visited.add(start);
    for (const next of neightbors) {
      if (next === dest) return product * valMap.get(start + '.' + dest);
      const res = dfs(next, dest, product * valMap.get(start + '.' + next), visited);
      if (res !== -1) return res;
    }
    return -1;
  }
};
```