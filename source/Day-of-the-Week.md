---
title: Leetcode 1185 - Day of the Week
date: 2022-01-02 15:57:28
tags:
---
**`Note:`**
- It's a `Friday` on Jan 1st 1971.
- Start calculate day diffs from that day.
- Then use `mod % 7` to find the offset.

**`Question:`**

Given a date, return the corresponding day of the week for that date.

The input is given as three integers representing the `day`, `month` and `year` respectively.

Return the answer as one of the following values `{"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}`.

**`Example:`**
```
Input: day = 18, month = 7, year = 1999
Output: "Sunday"
```

**`Code:`**
```javascript
/**
 * @param {number} day
 * @param {number} month
 * @param {number} year
 * @return {string}
 */
var dayOfTheWeek = function(day, month, year) {
  const months = [31,0,31,30,31,30,31,31,30,31,30,31];
  let diff = 0;
  const week = ['Friday', 'Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday'];
  for (let i = 1971; i < year; i++) {
    if (isLeapYear(i)) {
      diff += 366;
    } else {
      diff += 365;
    }
  }
  for (let i = 1; i < month; i++) {
    if (i === 2) {
      if (isLeapYear(year)) {
        diff += 29;
      } else {
        diff += 28;
      }
      continue;
    }
    diff +=  months[i - 1];
  }
  diff += day - 1;
  diff = diff % 7;
  return week[diff];

  function isLeapYear(year) {
    return year % 100 !== 0 && year % 4 === 0 || year % 100 === 0 && year % 400 === 0;
  }
};
```