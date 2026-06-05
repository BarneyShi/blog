---
title: Leetcode 168 - Excel sheet column title
date: 2021-11-04 02:51:31
tags:
- math
---
**`Note:`**
- This seems like an easy question but with traps.
- Normally, when we convert `decimal` into other `n-ary`. We do between `[0, x)`, and we add `1` to the prev digit when we hit `x`.
- Here, we are operating from `1` to `26`. Where did `0` go?
- Take `26` for example:
  - `26 % 26 === 0`. So we append `z` to the end.
  - We should end here, but `26 / 26 === 1` ??
  - No, don't keep going. Let's end it here coz we all know `26 === Z`.
  - Make `num -= 26` when the remainder is `0` !!

**`Question:`**

Given an integer columnNumber, return its corresponding column title as it appears in an Excel sheet.

For example:
```
A -> 1
B -> 2
C -> 3
...
Z -> 26
AA -> 27
AB -> 28 
...
```
**`Example:`**
```
Input: columnNumber = 701
Output: "ZY"
```

**`Code:`**
```javascript
/**
 * @param {number} columnNumber
 * @return {string}
 */
var convertToTitle = function(columnNumber) {
  let res = '';
  while (columnNumber !== 0) {
    const lastDigit = columnNumber % 26;
    if (lastDigit === 0) {
      res = 'Z' + res;
      columnNumber -= 26;
      columnNumber = ~~(columnNumber / 26);
      continue;
    }
    res = String.fromCharCode(lastDigit + 64) + res; 
    columnNumber = ~~(columnNumber / 26);
  }
  return res;
};
```