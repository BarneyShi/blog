---
title: Leetcode 447 - Number of Boomerangs
date: 2021-12-26 01:50:40
tags:
- hash table
---
**`Note:`**
- Not a really good problem. 
- For every `point`, build a map with `key = dist, val = point coords` (val should be an array).
- Math knowledge: For each pair, its val contains our `j` and `k`. Assume the `length` is `l`, how many `combinations` can we come up with? It's `l * (l - 1)`!

**`Question:`**

You are given `n` `points` in the plane that are all distinct, where `points[i] = [xi, yi]`. A boomerang is a tuple of points `(i, j, k)` such that the distance between `i` and `j` equals the distance between `i` and `k` (the order of the tuple matters).

Return the `number` of boomerangs.

**`Example:`**
```
Input: points = [[0,0],[1,0],[2,0]]
Output: 2
Explanation: The two boomerangs are [[1,0],[0,0],[2,0]] and [[1,0],[2,0],[0,0]].
```

**`Code:`**
```javascript
/**
 * @param {number[][]} points
 * @return {number}
 */
var numberOfBoomerangs = function(points) {
  let ans = 0;
  for (let i = 0; i < points.length; i++) {    
    let map = new Map();
    for (let j = 0; j < points.length; j++) {
      if (i === j) continue;
      const dist = (points[i][0] - points[j][0])**2 + (points[i][1] - points[j][1])**2;
      if (map.has(dist)) {
        map.set(dist, [...map.get(dist), [points[j][0], points[j][1]]]);
      } else {
        map.set(dist, [[points[j][0], points[j][1]]]);
      }
    }
    for (const [key, val] of map) {
      ans += val.length * (val.length - 1);
    }
  }
  return ans;
};
```