---
title: Leetcode 495 - Teemo attacking
date: 2021-11-09 16:44:53
tags:
---
**`Note:`**
- Don't use `init` and increment it by `1` every time, it's too slow.
- Use one for loop and calculate the time period by comparing if `timeSeries[i] + duration - 1 < timeSeries[i + 1]`.
- Also, when `i == len - 1`, it's a special case. It doesn't meet the above condition but we still do `res += duration`.

**`Question:`**

Our hero Teemo is attacking an enemy Ashe with poison attacks! When Teemo attacks Ashe, Ashe gets poisoned for a exactly `duration` seconds. More formally, an attack at second `t` will mean Ashe is poisoned during the inclusive time interval `[t, t + duration - 1]`. If Teemo attacks again before the poison effect ends, the timer for it is reset, and the poison effect will end `duration` seconds after the new attack.

You are given a non-decreasing integer array `timeSeries`, where `timeSeries[i]` denotes that Teemo attacks Ashe at second timeSeries[i], and an integer `duration`.

Return `the total number of seconds` that Ashe is poisoned.

**`Example:`**
```
Input: timeSeries = [1,4], duration = 2
Output: 4
Explanation: Teemo's attacks on Ashe go as follows:
- At second 1, Teemo attacks, and Ashe is poisoned for seconds 1 and 2.
- At second 4, Teemo attacks, and Ashe is poisoned for seconds 4 and 5.
Ashe is poisoned for seconds 1, 2, 4, and 5, which is 4 seconds in total.
```

**`Code:`**
```javascript
/**
 * @param {number[]} timeSeries
 * @param {number} duration
 * @return {number}
 */
 var findPoisonedDuration = function(timeSeries, duration) {
  let res = 0;
  for (let i = 0; i < timeSeries.length; i++) {
    if (i === timeSeries.length - 1 || timeSeries[i] + duration - 1 < timeSeries[i + 1]) {
      res += duration;
    } else {
      res += timeSeries[i + 1] - timeSeries[i];
    }
  }
  return res;
};
```