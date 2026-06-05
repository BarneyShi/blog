---
title: Leetcode 223 - Rectangle area
date: 2021-12-01 21:00:10
tags:
---
**`Note:`**
- ![img](https://i.imgur.com/lFXoXFc.png)
- It's easy to get areas of `A` and `B`.
- How to find their overlapped area?
  - Take `width` for example, if they are overlapped, then `Math.min(ax2, bx2) - Math.max(ax1, bx1) > 0`. Otherwise it's negative.

**`Question:`**

Given the coordinates of two `rectilinear` rectangles in a 2D plane, return the total area covered by the two rectangles.

The first rectangle is defined by its `bottom-left` corner (ax1, ay1) and its `top-right` corner `(ax2, ay2)`.

The second rectangle is defined by its `bottom-left` corner (bx1, by1) and its `top-right` corner `(bx2, by2)`.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/05/08/rectangle-plane.png)
```
Input: ax1 = -3, ay1 = 0, ax2 = 3, ay2 = 4, bx1 = 0, by1 = -1, bx2 = 9, by2 = 2
Output: 45
```

**`Code:`**
```javascript
/**
 * @param {number} ax1
 * @param {number} ay1
 * @param {number} ax2
 * @param {number} ay2
 * @param {number} bx1
 * @param {number} by1
 * @param {number} bx2
 * @param {number} by2
 * @return {number}
 */
var computeArea = function(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2) {
  const A = (ax2 - ax1) * (ay2 - ay1);
  const B = (bx2 - bx1) * (by2 - by1);
  const x = Math.max(0, Math.min(ax2, bx2) - Math.max(ax1, bx1));
  const y = Math.max(0, Math.min(ay2, by2) - Math.max(ay1, by1));
  return A + B - x * y;
};
```