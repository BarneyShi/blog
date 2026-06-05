---
title: Leetcode 1154 - Day of the year
date: 2021-12-20 18:05:51
tags:
---
**`Note:`**
- How to check if a year is a `leap year` or not?
- If it isn't divisible by `100`, check if it's divisible by `4`.
- If yes, check if it's divisible by `400`.

**`Question:`**

Given a string `date` representing a Gregorian calendar date formatted as `YYYY-MM-DD`, return the day number of the year.

**`Example:`**
```
Input: date = "2019-01-09"
Output: 9
Explanation: Given date is the 9th day of the year in 2019.
```

**`Code:`**
```javascript
/**
 * @param {string} date
 * @return {number}
 */
var dayOfYear = function(date) {
  let thirtyOneDays = new Set([1, 3, 5, 7, 8, 10, 12]);
  date = date.split('-').map(e => e - 0);
  let ans = 0;
  let month = date[1];
  ans += date[2];
  month--;
  while (month !== 0) {
    if (thirtyOneDays.has(month)) {
      ans += 31;
      month--;
    } else if (month === 2) {
      const year = date[0];
      if (year % 100 !== 0 && year % 4 === 0 || year % 100 === 0 && year % 400 === 0) {
        ans += 29;
        month--;
        continue;
      }
      ans += 28;
      month--;
    } else {
      ans += 30;
      month--;
    }
  }
  return ans;
};
```