---
title: Leetcode 56 - Merge intervals
date: 2021-10-07 21:16:44
tags:
- greedy
---
**`Note:`**
- Sort by start index.
- Update result's last element's `end index` if current item's `startIndex < result[length - 1][1]`

**`Question`**

Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

```javascript
/**
 * @param {number[][]} intervals
 * @return {number[][]}
 */
var merge = function(intervals) {
  intervals.sort((a, b) => a[0] - b[0]);
  let result = [[...intervals[0]]];
  for (let i = 1; i < intervals.length; i++) {
    if (intervals[i][0] > result[result.length - 1][1]) {
      result.push([...intervals[i]]);
    }
    result[result.length - 1][1] = Math.max(result[result.length - 1][1], intervals[i][1]);
  }
  return result;
};
```
