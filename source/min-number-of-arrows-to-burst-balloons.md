---
title: Leetcode 452 - Min number of arrows to burst balloons
date: 2021-10-07 01:09:30
tags:
- greedy
---
**`Note:`**
- As we've seen in other greedy questions:
  - Local optima: Min arrows in every shot
  - Global optima: Min arrows on all shots
- And as we'be concluded, when it's `2D` array, we need to sort it first. Yes, in this question, we can sort either by `start` or `end`.
  - Sort by `start`, use `boundary` to check if `points[i]` is in between. If not, update.
  - Sort by `end`, less code we need to write. Use `pos` to record boundaries. We only need to compare if `points[i][0]` is less than `pos`.
  ![img](https://i.imgur.com/d9M7yfL.png) 

There are some spherical balloons taped onto a flat wall that represents the XY-plane. The balloons are represented as a 2D integer array points where `points[i] = [xstart, xend]` denotes a balloon whose `horizontal diameter` stretches between xstart and xend. You do not know the exact y-coordinates of the balloons.

Arrows can be shot up `directly vertically` (in the positive y-direction) from different points along the x-axis. A balloon with `xstart` and `xend` is burst by an arrow shot at x if `xstart <= x <= xend`. There is no limit to the number of arrows that can be shot. A shot arrow keeps traveling up infinitely, bursting any balloons in its path.

Given the array points, return the `minimum` number of arrows that must be shot to burst all balloons.

**Example**
```
Input: points = [[10,16],[2,8],[1,6],[7,12]]
Output: 2
Explanation: The balloons can be burst by 2 arrows:
- Shoot an arrow at x = 6, bursting the balloons [2,8] and [1,6].
- Shoot an arrow at x = 11, bursting the balloons [10,16] and [7,12].
```

**`Greedy - Not optimal`**
```javascript
/**
 * @param {number[][]} points
 * @return {number}
 */
var findMinArrowShots = function(points) {
  points.sort((a, b) => a[0] - b[0]);
  let result = 1;
  let boundary = [points[0][0], points[0][1]];
  for (let i = 1; i < points.length; i++) {
    if (points[i][0] >= boundary[0] && points[i][0] <= boundary[1]) {
      boundary[0] = points[i][0];
      boundary[1] = Math.min(boundary[1], points[i][1]);
      continue;
    } else {
      boundary[0] = points[i][0];
      boundary[1] = points[i][1];
      result++;
    }
  }
  return result;
};
```

**`Greedy - Optimal`**
```javascript
/**
 * @param {number[][]} points
 * @return {number}
 */
var findMinArrowShots = function(points) {
  points.sort((a, b) => a[1] - b[1]);
  let result = 1;
  let pos = points[0][1];
  for (let i = 1; i < points.length; i++) {
    if (points[i][0] > pos) {
      result++;
      pos = points[i][1];
    }
  }
  return result;
};
```