---
title: Leetcode 812 - Largest Triangle Area
date: 2022-01-01 19:07:34
tags:
- math
---
**`Note:`**
- Know how to use `cross product` to calculate area.
- $Area = |AB x AC| = |a_x*b*y - a_y*b_x|$
- Because $|AB x AC| = |AB||AC|sin_{\theta}$, it's the area of the parallelogram. Divide it by 2, it's the area of the triangle!

**`Question:`**

Given an array of `points` on the X-Y plane points where `points[i] = [xi, yi]`, return the area of the largest triangle that can be formed by any three different points. Answers within $10^{-5}$ of the actual answer will be accepted.

**`Example:`**

![img](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/04/1027.png)
```
Input: points = [[0,0],[0,1],[1,0],[0,2],[2,0]]
Output: 2.00000
Explanation: The five points are shown in the above figure. The red triangle is the largest.
```

**`Code:`**
```javascript
/**
 * @param {number[][]} points
 * @return {number}
 */
var largestTriangleArea = function(points) {
  let max = 0;
  for (let i = 0; i < points.length; i++) {
    for (let j = i + 1; j < points.length; j++) {
      for (let l = j + 1; l < points.length; l++) {
        const curr = area(points[i], points[j], points[l]);
        if (curr > max) max = curr;
      }
    }
  }
  return max;

  function area(a, b, c) {
    const vectorAB = [b[0] - a[0], b[1] - a[1]];
    const vectorAC = [c[0] - a[0], c[1] - a[1]];

    return Math.abs((vectorAB[0] * vectorAC[1] - vectorAB[1] * vectorAC[0]) / 2);
  }
};
```