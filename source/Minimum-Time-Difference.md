---
title: Leetcode 539 - Minimum Time Difference
date: 2022-01-15 23:50:35
tags:
---
**`Note:`**
- Convert elements into number with fractions. (Fractions are mins)
- Sort
- Compare diff. Note that we need to compare `last one` with `first one` in case of edge case.

**`Question:`**

Given a list of `24-hour` clock time points in "`HH:MM`" format, return the `minimum minutes difference` between any two time-points in the list.

**`Example:`**
```
Input: timePoints = ["23:59","00:00"]
Output: 1
```

**`Code:`**
```javascript
/**
 * @param {string[]} timePoints
 * @return {number}
 */
 var findMinDifference = function(timePoints) {
  timePoints = timePoints.map(e => {
    return e.replace(/:/g, '.') - 0;
  })
  timePoints.sort((a, b) => a - b);
  let ans = Infinity;
  for (let i = 1; i < timePoints.length; i++) {
    const hrDiff = (~~(timePoints[i]) - ~~(timePoints[i - 1])) * 60;
    const minDiff = (((timePoints[i]) % 1) * 100) - ((timePoints[i - 1] % 1) * 100);
    if (hrDiff + minDiff < ans) ans = hrDiff + minDiff;
    if (i === timePoints.length - 1) {
      const hDiff = (23 - ~~(timePoints[i])) * 60 + ~~timePoints[0] * 60;
      const mDiff = (60 - (timePoints[i] % 1) * 100) + ((timePoints[0] % 1) * 100);
      if (hDiff + mDiff < ans) ans = hDiff + mDiff;
    }
  }
  return ans;
};
```