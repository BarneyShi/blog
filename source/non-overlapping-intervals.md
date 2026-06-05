---
title: Leetcode 435 - Non-overlapping intervals
date: 2021-10-07 17:10:19
tags:
- greedy
---
**`Note:`**
- How to be greedy?
  - Local optima: If the curernt interval overlaps with prev intervals, removing only it def costs less than removing some prev intervals.
  - Global optima: Min deleltions.
- Much like the `balloons` problem:
  - `Sorting` by `end` first makes it easier.
  - If the current interval doesn't overlap with prev intervals, join them all as a new bigger interval.
  - If the current interval overlaps with prev intervals, delete the current one only! 

Given an array of `intervals` intervals where `intervals[i] = [starti, endi]`, return the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.

**Exmaple**
```
Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
Output: 1
Explanation: [1,3] can be removed and the rest of the intervals are non-overlapping.
```

```javascript
/**
 * @param {number[][]} intervals
 * @return {number}
 */
var eraseOverlapIntervals = function(intervals) {
  intervals.sort((a, b) => a[1] - b[1]);
  let pos = intervals[0][1];
  let ans = 0;
  for (let i = 1; i < intervals.length; i++) {
    if (intervals[i][0] >= pos) {
      pos = intervals[i][1];
      continue;
    }
    ans++;
  }
  return ans;
};
```

