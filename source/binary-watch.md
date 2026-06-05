---
title: Leetcode 401 - Binary watch
date: 2021-11-11 03:36:24
tags:
- dfs
- backtracking
---
**`Note:`**
- `Bitwise`
  - It's a `binary` watch. `Hour` is represented by `4 bits`. `Min` is represented by `6 bits`.
  - `The number of 1`s in each binary number means how many `LEDs are on`.

- Too many cases, using `backtracking` is good for finding out all combinations.
- Need to seperately call `dfs` on `hour[]` and `min[]`.
- Use two tmp arrays to contain H/M, then use a `double for loop` to get all `combinations`.

**`Question:`**

A binary watch has 4 LEDs on the top which represent the hours (0-11), and the 6 LEDs on the bottom represent the minutes (0-59). Each LED represents a zero or one, with the least significant bit on the right.

- For example, the below binary watch reads "4:51".
![img](https://assets.leetcode.com/uploads/2021/04/08/binarywatch.jpg)

Given an integer `turnedOn` which represents the number of LEDs that are currently on, return all possible times the watch could represent. You may return the answer in any order.

The hour must not contain a leading zero.

- For example, "01:00" is not valid. It should be "1:00".
The minute must be consist of two digits and may contain a leading zero.

- For example, "10:2" is not valid. It should be "10:02".

**`Example:`**
```
Input: turnedOn = 1
Output: ["0:01","0:02","0:04","0:08","0:16","0:32","1:00","2:00","4:00","8:00"]
```

**`Code:`**

**`BitWise`**
```javascript
var readBinaryWatch = function(turnedOn) {
    const ans = [];
    for (let h = 0; h < 12; ++h) {
        for (let m = 0; m < 60; ++m) {
            if (h.toString(2).split('0').join('').length + m.toString(2).split('0').join('').length === turnedOn) {
                ans.push(h + ":" + (m < 10 ? "0" : "") + m);
            }
        }
    }
    return ans;
};
```

**`DFS + Backtracking`**
```javascript
/**
 * @param {number} turnedOn
 * @return {string[]}
 */
 var readBinaryWatch = function(turnedOn) {
  const hour = [8,4,2,1];
  const min = [32,16,8,4,2,1];
  let result = [];
  let path = [];
  for (let i = 0; i <= turnedOn; i++) {
    let hourOption = [];
    let minOption = [];
    const j = turnedOn - i;
    dfs(hour, 0, i, true, hourOption);
    dfs(min, 0, j, false, minOption);
    for (let m = 0; m < hourOption.length; m++) {
      for (let n = 0; n < minOption.length; n++) {
        result.push(hourOption[m] + ':' + (minOption[n] < 10 ? ('0' + minOption[n]) : minOption[n]));
      }
    }
  }
  return result;

  function dfs(timeSeries, startIndex, count, isHour, options) {
    if (path.length === count) {
      const sum = path.reduce((acc, cur) => acc + cur, 0);
      if (isHour && sum <= 11 || !isHour && sum <= 59) {
        options.push(sum);
      }
      return;
    }
    for (let i = startIndex; i < timeSeries.length; i++) {
      path.push(timeSeries[i]);
      dfs(timeSeries, i + 1, count, isHour, options);
      path.pop();
    }
  }
};
```