---
title: Leetcode 806 - Number of Lines To Write String
date: 2021-12-31 02:35:01
tags:
---
**`Note:`**
- Edge case: curr line already has `99` pixels, the next char cost `2` pixels. We need to start a new line.

**`Question:`**

You are given a string `s` of lowercase English letters and an array `widths` denoting how many pixels wide each lowercase English letter is. Specifically, `widths[0]` is the width of 'a', `widths[1]` is the width of 'b', and so on.

You are trying to write s across several lines, where each line is no longer than 100 pixels. Starting at the beginning of `s`, write as many letters on the first line such that the total width does not exceed `100` pixels. Then, from where you stopped in `s`, continue writing as many letters as you can on the second line. Continue this process until you have written all of `s`.

Return an array `result` of length 2 where:

- result[0] is the total number of lines.
- result[1] is the width of the last line in pixels.

**`Example:`**
```
Input: widths = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], s = "abcdefghijklmnopqrstuvwxyz"
Output: [3,60]
Explanation: You can write s as follows:
abcdefghij  // 100 pixels wide
klmnopqrst  // 100 pixels wide
uvwxyz      // 60 pixels wide
There are a total of 3 lines, and the last line is 60 pixels wide.
```

**`Code:`**
```javascript
/**
 * @param {number[]} widths
 * @param {string} s
 * @return {number[]}
 */
var numberOfLines = function(widths, s) {
  let lines = 1, curr = 0;
  for (let i = 0; i < s.length; i++) {
    const index = s[i].charCodeAt() - 'a'.charCodeAt();
    if (widths[index] + curr <= 100) {
      curr += widths[index];
    } else {
      lines += 1;
      curr = widths[index];
    }
  }
  return [lines, curr];
};
```