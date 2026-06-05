---
title: Leetcode 319 - Perfect rectangle
date: 2021-11-15 18:26:35
tags:
---
**`Note:`**
- Two conditions must be met to form a perfect rectangle:
  - `Total area = sum of every little rectangle`
  - The `4 vertexes` must only `appear once`.
  - Every other vertex must only appear `twice or 4 times`.

**`Question:`**

Given an array `rectangles` where `rectangles[i] = [xi, yi, ai, bi]` represents an axis-aligned rectangle. The bottom-left point of the rectangle is `(xi, yi)` and the top-right point of it is `(ai, bi)`.

Return `true` if all the rectangles together form an exact cover of a rectangular region.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/03/27/perectrec1-plane.jpg)
```
Input: rectangles = [[1,1,3,3],[3,1,4,2],[3,2,4,4],[1,3,2,4],[2,3,3,4]]
Output: true
Explanation: All 5 rectangles together form an exact cover of a rectangular region.
```

**`Code:`**
```javascript
/**
 * @param {number[][]} rectangles
 * @return {boolean}
 */
 var isRectangleCover = function(rectangles) {
  let bottomLeft = [Infinity, Infinity];
  let topRight = [0, 0];
  let totalArea = 0;
  for (const r of rectangles) {
    totalArea += (r[2] - r[0]) * (r[3] - r[1]);
    // Do not use `distance formula` here. We are only looking for vertex that is left most or right most.
    bottomLeft[0] = Math.min(bottomLeft[0], r[0]);
    bottomLeft[1] = Math.min(bottomLeft[1], r[1]);
    topRight[0] = Math.max(topRight[0], r[2]);
    topRight[1] = Math.max(topRight[1], r[3]);
  }
  if ((topRight[0] - bottomLeft[0]) * (topRight[1] - bottomLeft[1]) !== totalArea) return false;

  let bottomRight = [topRight[0], bottomLeft[1]];
  let topLeft = [bottomLeft[0], topRight[1]];
  let vertexMap = new Map();
  const fourVertexes = [topLeft[0] + ',' + topLeft[1], topRight[0] + ',' + topRight[1], bottomLeft[0] + ',' + bottomLeft[1], bottomRight[0] + ',' + bottomRight[1]];
  for (const r of rectangles) {
    const bl = r[0] + ',' + r[1];
    const br = r[2] + ',' + r[1];
    const tl = r[0] + ',' + r[3];
    const tr = r[2] + ',' + r[3];
    if (!vertexMap.has(bl)) {
      vertexMap.set(bl, 1);
    } else {
      vertexMap.set(bl, vertexMap.get(bl) + 1);
    } 
    if (!vertexMap.has(br)) {
      vertexMap.set(br, 1);      
    } else {
      vertexMap.set(br, vertexMap.get(br) + 1);
    }
    if (!vertexMap.has(tl)) {
      vertexMap.set(tl, 1);      
    } else {
      vertexMap.set(tl, vertexMap.get(tl) + 1);
    }
    if (!vertexMap.has(tr)) {
      vertexMap.set(tr, 1);      
    } else {
      vertexMap.set(tr, vertexMap.get(tr) + 1);
    }
  }
  for (const [key, val] of vertexMap) {
    if (fourVertexes.includes(key) && val !== 1) return false;
    if (!fourVertexes.includes(key) && (val > 4 || val % 2 !== 0)) return false;
  }
  return true;
};
```