---
title: Leetcode 6 - Zigzag conversion
date: 2021-11-20 22:07:15
tags:
- string
---
**`Note:`**
- Iterate by `ROWS`.
- ![img](https://i.imgur.com/ZGwJ9YG.png)
- Create an array with `numRows` length.
- Each element is an empty string to store chars.
- Use a `flag` to denote the direction of moving. It's either `-1` or `1`. 1 means moving down, and -1 means moving up.
- When the row is `0` or `numRows - 1`, flip the flag. 

**`Question:`**

The string "`PAYPALISHIRING`" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
```
P   A   H   N
A P L S I I G
Y   I   R
```
And then read line by line: "`PAHNAPLSIIGYIR`"

Write the code that will take a string and make this conversion given a number of rows:
```
string convert(string s, int numRows);
```

**`Example:`**
```
Input: s = "PAYPALISHIRING", numRows = 3
Output: "PAHNAPLSIIGYIR"
```

**`Code:`**

**`Iterate by rows`**
```javascript
/**
 * @param {string} s
 * @param {number} numRows
 * @return {string}
 */
 var convert = function(s, numRows) {
   if (numRows === 1) return s;
   numRows = Math.min(numRows, s.length);
   let rows = [...Array(numRows).fill('')];
   let flag = -1;
   let i = 0;
   for (const char of s) {
     rows[i] += char;
     if (i === 0 || i === numRows - 1) {
       flag = - flag;
     }
     i += flag;
   }
   return rows.join('');
};
```

**`Naive simulation with big space complexity`**
```javascript
/**
 * @param {string} s
 * @param {number} numRows
 * @return {string}
 */
 var convert = function(s, numRows) {
   if (numRows === 1) return s;
  const cols = s.length;
  let grid = [...Array(numRows)].map(e => Array(cols));
  let i = 0;
  let j = 0;
  let isDown = true;
  let isDiagonal = false;
  for (let k = 0; k < s.length; k++) {
    if (isDown) {
      grid[i][j] = s[k];
      if (i === numRows - 1) {
        isDown = false;
        isDiagonal = true;
        i = i - 1;
        j = j + 1;
      } else {
        i = i + 1;
      }
    } else if (isDiagonal) {
      grid[i][j] = s[k];
      if (i === 0) {
        isDown = true;
        isDiagonal = false;
        i++;
      } else {
        i = i - 1;
        j = j + 1;
      }
    }
  }
  let res = '';
  for (let m = 0; m < grid.length; m++) {
    for (let n = 0; n < grid[0].length; n++) {
      if (grid[m][n]) res += grid[m][n];
    }
  }
  return res;
};
```