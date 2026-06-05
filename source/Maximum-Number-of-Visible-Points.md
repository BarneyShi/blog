---
title: Leetcode 1610 - Maximum Number of Visible Points
date: 2021-12-15 20:38:10
tags:
- sliding window
- math
---
**`Note:`**
- How to calculate `polar angle`? - The angle between a point and the origin. (`[-PI, PI]`).
  - ![img](https://i.imgur.com/ng6ePOt.png)
  - Use `Math.atan2(x, y)` in JS. The result is in rad.
- For every point other that the `location`, calculate its polar angle and put it into `angles[]`.
- Sort them in `ascending order`.
- A tricky detail:
  - ![img](https://i.imgur.com/hcVERXu.png)
  - The diff between these two angles are actually `< angle`. But because `a > 0` and `b < 0`, the result from `atan2(a, b)` might `> angle`.
  - How to solve this?
  - Add `360` to each angle after sorting, and append the array to `angles[]`.
  - Assume `b` was in the very front, and `a` was the biggest in the end.
  - After appending the new array, now `a` and `b + 360` are neighbors!
  - Something like `[b, ..., a, b + 360, ..., a + 360]`.
- Use sliding window to find the longest length when `angles[r] - angles[l] <= angle`.

**`Question:`**

You are given an array `points`, an integer `angle`, and your `location`, where `location = [posx, posy]` and `points[i] = [xi, yi]` both denote integral coordinates on the X-Y plane.

Initially, you are facing directly east from your position. You cannot move from your position, but you can rotate. In other words, `posx` and `posy` cannot be changed. Your field of view in degrees is represented by `angle`, determining how wide you can see from any given view direction. Let d be the amount in degrees that you rotate counterclockwise. Then, your field of view is the inclusive range of angles `[d - angle/2, d + angle/2]`.

You can `see` some set of points if, for each point, the angle formed by the point, your position, and the immediate east direction from your position is in your field of view.

There can be multiple points at one coordinate. There may be points at your location, and you can always see these points regardless of your rotation. Points do not obstruct your vision to other points.

Return the `maximum number` of points you can see.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/09/30/89a07e9b-00ab-4967-976a-c723b2aa8656.png)
```
Input: points = [[2,1],[2,2],[3,3]], angle = 90, location = [1,1]
Output: 3
Explanation: The shaded region represents your field of view. All points can be made visible in your field of view, including [3,3] even though [2,2] is in front and in the same line of sight.
```

**`Code:`**
```javascript
/**
 * @param {number[][]} points
 * @param {number} angle
 * @param {number[]} location
 * @return {number}
 */
var visiblePoints = function(points, angle, location) {
  let self = 0;
  let ans = 0;
  let angles = [];
  
  for (const [x, y] of points) {
    if (x === location[0] && y === location[1]) {
      self++;
    } else {
      const a = calculateAngleDiff(x, y);
      angles.push(a);
    }
  }
  // Sort by angles in ascending order, all angles are between [-pi, pi]
  angles.sort((a, b) => a - b);
  // Append (angle + 2PI) to the end
  angles = angles.concat(angles.map(e => e + 360));

  for (let l = 0, r = 0; r < angles.length; r++) {
    while (l < r && angles[r] - angles[l] > angle) {
      l++;
    }
    ans = Math.max(ans, r - l + 1);
  }

  return ans + self;

  function calculateAngleDiff(x, y) {
    return Math.atan2(y - location[1], x - location[0]) * 180 / Math.PI;
  }
};
```