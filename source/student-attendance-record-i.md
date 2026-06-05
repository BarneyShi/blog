---
title: Leetcode 551 - Student attendance record I
date: 2021-12-03 18:52:47
tags:
---
**`Note:`**
- Pretty easy regex problem
- Remember to use `g` flag.

**`Question:`**

You are given a string `s` representing an attendance record for a student where each character signifies whether the student was absent, late, or present on that day. The record only contains the following three characters:

- `'A'`: Absent.
- `'L'`: Late.
- `'P'`: Present.

The student is eligible for an attendance award if they meet both of the following criteria:

- The student was absent `('A')` for strictly fewer than 2 days total.
- The student was never late `('L')` for 3 or more consecutive days.

Return `true` if the student is eligible for an attendance award, or `false` otherwise.

**`Example:`**
```
Input: s = "PPALLP"
Output: true
Explanation: The student has fewer than 2 absences and was never late 3 or more consecutive days.
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {boolean}
 */
var checkRecord = function(s) {
  const regexA = s.match(/A/g);
  const regexL = s.match(/(LLL)+/g);
  return (regexA === null || regexA.length < 2) && regexL === null;
};
```