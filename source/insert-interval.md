---
title: Leetcode 57 - Insert interval
date: 2021-11-22 22:30:02
tags:
- array
---
**`Note:`**
- How to find the first element that overlaps with `newInterval`?
  - `interval[1] > newInterval[0]`!.
- From `firstOverlapIndex` to the end, how to check if an interval overlaps with newInterval?
  - `interval[0] > newInterval[1]`.
- Merge two intervals with comparing `minStart` and `maxEnd`.
- After merging overlapped intervals, add the rest intervals into `res[]`.

**`Question:`**

You are given an array of non-overlapping intervals `intervals` where `intervals[i] = [starti, endi]` represent the start and the end of the `ith` interval and `intervals` is sorted in ascending order by `starti`. You are also given an interval `newInterval = [start, end]` that represents the start and end of another interval.

Insert `newInterval` into `intervals` such that `intervals` is still sorted in ascending order by `starti` and `intervals` still does not have any overlapping intervals (merge overlapping intervals if necessary).

Return `intervals` after the insertion.

**`Example:`**
```
Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
Output: [[1,5],[6,9]]
```

**`Code:`**

**`Simplified`**
```javascript
/**
 * @param {number[][]} intervals
 * @param {number[]} newInterval
 * @return {number[][]}
 */
 var insert = function(intervals, newInterval) {
  let insertIndex = -1;
  let res = [];
  for (let i = 0; i < intervals.length; i++) {
    if (intervals[i][1] >= newInterval[0]) {
      insertIndex = i;
      break;
    } else {
      res.push(intervals[i]);
    }
  }
  if (insertIndex !== -1) {
    while (insertIndex < intervals.length && intervals[insertIndex][0] <= newInterval[1]) {
      newInterval[0] = Math.min(newInterval[0], intervals[insertIndex][0]);
      newInterval[1] = Math.max(newInterval[1], intervals[insertIndex][1]);
      insertIndex++;
    }
    res.push(newInterval);
    while (insertIndex < intervals.length) {
      res.push(intervals[insertIndex]);
      insertIndex++;
    }
    return res;
  }
  return [...intervals, newInterval];
};
```

**`OC Naive way`**
```javascript
/**
 * @param {number[][]} intervals
 * @param {number[]} newInterval
 * @return {number[][]}
 */
 var insert = function(intervals, newInterval) {
  let insertIndex = -1;
  for (let i = 0; i < intervals.length; i++) {
    if (intervals[i][0] <= newInterval[0] && intervals[i][1] >= newInterval[0]) {
      intervals.splice(i + 1, 0, newInterval);
      insertIndex = i;
      break;
    } else if (newInterval[0] <= intervals[i][0]) {
      intervals.splice(i, 0, newInterval);
      insertIndex = i;
      break;
    }
  }
  if (insertIndex !== -1) {
    let i = insertIndex;
    while (true) {
      if (i < intervals.length - 1 && intervals[i][0] <= intervals[i + 1][0] && intervals[i][1] >= intervals[i + 1][0]) {
        let tmp = [Math.min(intervals[i][0], intervals[i + 1][0]), Math.max(intervals[i][1], intervals[i + 1][1])];
        intervals.splice(i, 2, tmp);
      } else {
        return intervals;
      }
    }
  }
  if (insertIndex === -1) return [...intervals, newInterval];
};
```