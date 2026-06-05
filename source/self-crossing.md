---
title: Leetcode 335 - Self crossing
date: 2021-10-29 01:18:38
tags:
- array
---
**`Note:`**
- There are three situations
  - ![img](https://i.imgur.com/kgqznCF.png)
  - ![img](https://i.imgur.com/93sgyGU.png)
  - ![img](https://i.imgur.com/lQXH4YA.png)
- Note: For this situation, we just need to rotate it, and it becomes situation1.
  ![img](https://i.imgur.com/TP055HT.png)

**`Question:`**

You are given an array of integers `distance`.

You start at point `(0,0)` on an X-Y plane and you move `distance[0]` meters to the north, then `distance[1]` meters to the west, distance[2] meters to the south, distance[3] meters to the east, and so on. In other words, after each move, your direction changes counter-clockwise.

Return `true` if your path crosses itself, and `false` if it does not.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/03/14/selfcross1-plane.jpg)
```
Input: distance = [2,1,1,2]
Output: true
```

**`Code:`**
```javascript
/**
 * @param {number[]} distance
 * @return {boolean}
 */
var isSelfCrossing = function(distance) {
  const len = distance.length;
  if(len < 4) return false;
  for (let i = 3; i < len; i++) {
    if (distance[i] >= distance[i-2] && distance[i-1] <= distance[i-3]) return true;
    if (i >= 4 && distance[i-2] <= distance[i] + distance[i-4] && distance[i-3] === distance[i-1]) return true;
    if (i >= 5 && distance[i-1] <= distance[i-3] && distance[i] + distance[i-4] >= distance[i-2] && distance[i-2] > distance[i-4] && distance[i-1] + distance[i-5] >= distance[i-3]) return true;
  }
  return false;
};
```