---
title: Leetcode 436 - Find Right Interval
date: 2021-12-20 19:59:41
tags:
- binary search
- hash table
---
**`Note:`**
- Use `map` to store original indexes.
- Then sort it based on `start`.
- For each <font color=red>$end_i$</font>, find the first <font color=red>$start_j$</font> that $start_j > end_i$.
- Apparently, if we use `binary search`, we can finish in `O(logn)`.

**`Question:`**

You are given an array `of intervals`, where `intervals[i] = [starti, endi]` and each `starti` is unique.

The right interval for an interval `i` is an interval `j` such that `startj >= endi` and `startj` is minimized.

Return an array of right interval indices for each interval `i`. If no right interval exists for interval `i`, then put `-1` at index `i`.

**`Example:`**
```
Input: intervals = [[3,4],[2,3],[1,2]]
Output: [-1,0,1]
Explanation: There is no right interval for [3,4].
The right interval for [2,3] is [3,4] since start0 = 3 is the smallest start that is >= end1 = 3.
The right interval for [1,2] is [2,3] since start1 = 2 is the smallest start that is >= end2 = 2.
```

**`Code:`**
```javascript
/**
 * @param {number[][]} intervals
 * @return {number[]}
 */
 var findRightInterval = function(intervals) {
  let map = new Map();
  for (const [i, [a, b]] of intervals.entries()) {
    map.set(a + '.' + b, i);
  }
  intervals.sort((a, b) => a[0] - b[0]);
  let ans = [...new Array(intervals.length).fill(-1)];
  for (let i = 0; i < intervals.length; i++) {
    const index = map.get(intervals[i][0] + '.' + intervals[i][1]);
    let j = i;
    let left = i, right = intervals.length - 1;
    while (left < right) {
      const mid = (left + right) >> 1;
      if (intervals[mid][0] < intervals[i][1]) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    if (intervals[left][0] >= intervals[i][1]) {
      ans[index] = map.get(intervals[left][0] + '.' + intervals[left][1]);
    } else {
      ans[index] = -1;
    }
  }
  return ans;
};
```