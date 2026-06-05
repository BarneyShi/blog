---
title: Leetcode 836 - Rectangle Overlap
date: 2022-01-09 15:34:38
tags:
- math
---
**`Note:`**
- Project both rectangles to `x-axios` and `y-axios`.
- ![img](https://i.imgur.com/khYfkWN.png)
- It's easier to get when they don't overlap.
- Reverse the bool.

**`Question:`**

An axis-aligned rectangle is represented as a list `[x1, y1, x2, y2]`, where `(x1, y1)` is the coordinate of its bottom-left corner, and `(x2, y2)` is the coordinate of its top-right corner. Its top and bottom edges are parallel to the X-axis, and its left and right edges are parallel to the Y-axis.

Two rectangles overlap if the area of their intersection is positive. To be clear, two rectangles that only touch at the corner or edges do not overlap.

Given two axis-aligned rectangles `rec1` and `rec2`, return `true` if they `overlap`, otherwise return false.

**`Example:`**
```
Input: rec1 = [0,0,2,2], rec2 = [1,1,3,3]
Output: true
```

**`Code:`**
```javascript
/**
 * @param {number[]} rec1
 * @param {number[]} rec2
 * @return {boolean}
 */
var isRectangleOverlap = function(rec1, rec2) {
  const xOverlap = !(rec1[2] <= rec2[0] || rec2[2] <= rec1[0]);
  const yOverlap = !(rec1[1] >= rec2[3] || rec1[3] <= rec2[1]);
  return xOverlap && yOverlap;
};
```