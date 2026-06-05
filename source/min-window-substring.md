---
title: Leetcode 76 - Min window substring
date: 2021-11-15 22:48:57
tags:
- sliding window
---
**`Note:`**
- Use a `map` to track the count of each letter in `t`. It means how many letters we need for each one in `s`.
- We also need a `needChars` to track the total letter we need. Without this variable, every time we have to iterate the whole map once we move. It's gonna be really inefficient.
- ![img](https://assets.leetcode-cn.com/solution-static/76/76_fig1.gif)
- Use `i` and `j` to mark the length of the sliding window.
- When `needChars` is not 0, keep moving `j` until its 0.
- Once it's zero, shrink the window and compare current length with `minWindow` size.
- When `enlarging` the window, if current `char` is in the map, and its map value is `bigger than 0`, we should do `needChars--`, which means we found a char that should be in our window. If not, we might have got extra char or it's not in the map. Keep widening the window if `needChars` is not 0.
- Once `needChars` is 0, let start shrinking the window.
- While `shrinking` the window
  - First, check if current length is shorter than `minWindow`. If yes, update it.
  - If `s[i]` is in the map, and its value is 0, it means we will missing one s[i] after shrinking the window by 1. Terminate the shrinking process, and jump to next iteration of enlarging the window with `j++`.

**`Question:`**

Given two strings `s` and `t` of lengths `m` and `n` respectively, return the minimum window substring of `s` such that every character in `t` (including `duplicates`) is included in the window. If there is no such substring, return the empty string `""`.

The testcases will be generated such that the answer is `unique`.

A substring is a contiguous sequence of characters within the string.

**`Example:`**
```
Input: s = "ADOBECODEBANC", t = "ABC"
Output: "BANC"
Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {string} t
 * @return {string}
 */
var minWindow = function(s, t) {
  let tMap = new Map();
  let needChars = 0;
  for (const char of t) {
    if (!tMap.has(char)) {
      tMap.set(char, 1);
    } else {
      tMap.set(char, tMap.get(char) + 1);
    }
    needChars++;
  }
  let minWindow = null;
  let i = 0, j = 0;
  while (j < s.length) {
    if (!tMap.has(s[j])) {
      j++;
      continue;
    }
    if (tMap.get(s[j]) > 0) needChars--;
    tMap.set(s[j], tMap.get(s[j]) - 1);
    while (needChars === 0) {
      if (!minWindow || j - i + 1 < minWindow.length) {
        minWindow = s.slice(i, j + 1);
      }
      let tmp = s[i];
      i++;
      if (tMap.has(tmp)) tMap.set(tmp, tMap.get(tmp) + 1);
      if (tMap.get(tmp) > 0) {
        needChars++;
        break;
      }
    }
    j++;
  }
  return minWindow === null ? '' : minWindow;
};
```