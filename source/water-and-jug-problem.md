---
title: Leetcode 365 - Water and Jug Problem
date: 2021-12-07 23:58:21
tags:
- dfs
---
**`Note:`**
- Use `[water1, water2]` to represent how much water left in each jug.
- Each time, based on the three ops, modify next states.
- Be careful when pouring water from one to another.
  - For example, use `a` to fill `b`. The rest water in `a` is the max between `0` and `water1 - jug2 + water2`. Same for `b`, if `a` is too big, `b` won't have all the water. So `b` is the min of `jug2` and `water2 + water1`.
- Use `iterative` instead of `recursive` to save spaces.

**`Question:`**

You are given two jugs with capacities `jug1Capacity` and `jug2Capacity` liters. There is an infinite amount of water supply available. Determine whether it is possible to measure exactly `targetCapacity` liters using these two jugs.

If `targetCapacity` liters of water are measurable, you must have targetCapacity liters of water contained within one or both buckets by the end.

Operations allowed:

- Fill any of the jugs with water.
- Empty any of the jugs.
- Pour water from one jug into another till the other jug is completely full, or the first jug itself is empty.

**`Example:`**
```
Input: jug1Capacity = 3, jug2Capacity = 5, targetCapacity = 4
Output: true
Explanation: The famous Die Hard example 
```

**`Code:`**
```javascript
/**
 * @param {number} jug1Capacity
 * @param {number} jug2Capacity
 * @param {number} targetCapacity
 * @return {boolean}
 */
var canMeasureWater = function(jug1Capacity, jug2Capacity, targetCapacity) {
  let visited = new Set();
  let stack = [[0,0]];
  while (stack.length > 0) {
    const [water1, water2] = stack.pop();
    if (visited.has(water1 + '.' + water2)) continue;
    if (water1 === targetCapacity || water2 === targetCapacity || water1 + water2 === targetCapacity) return true; 
    visited.add((water1 + '.' + water2));
    stack.push([jug1Capacity, water2]);
    stack.push([water1, jug2Capacity]);
    stack.push([0, water2]);
    stack.push([water1, 0]);
    stack.push([Math.max(0, water1 - (jug2Capacity - water2)), Math.min(jug2Capacity, water2 + water1)]);
    stack.push([Math.min(jug1Capacity, water1 + water2), Math.max(0, water2 - (jug1Capacity - water1))]);
  }
  return false;
};
```