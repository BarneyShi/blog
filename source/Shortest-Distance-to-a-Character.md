---
title: Leetcode 821 - Shortest Distance to a Character
date: 2022-01-03 00:52:11
tags:
---
**`Note:`**
- Key part is how to find the first element in `occurence[]` that is bigger than index i.
- Three situations:
  - Before occurence[0]
  - Between two occurence
  - After last occurence.

**`Question:`**

Given a string `s` and a character `c` that occurs in `s`, return an array of integers `answer` where `answer.length == s.length` and `answer[i]` is the `distance` from index `i` to the `closest` occurrence of character c in s.

The distance between two indices `i` and `j` is `abs(i - j)`, where `abs` is the absolute value function.

**`Example:`**
```
Input: s = "loveleetcode", c = "e"
Output: [3,2,1,0,1,0,0,1,2,2,1,0]
Explanation: The character 'e' appears at indices 3, 5, 6, and 11 (0-indexed).
The closest occurrence of 'e' for index 0 is at index 3, so the distance is abs(0 - 3) = 3.
The closest occurrence of 'e' for index 1 is at index 3, so the distance is abs(1 - 3) = 2.
For index 4, there is a tie between the 'e' at index 3 and the 'e' at index 5, but the distance is still the same: abs(4 - 3) == abs(4 - 5) = 1.
The closest occurrence of 'e' for index 8 is at index 6, so the distance is abs(8 - 6) = 2.
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {character} c
 * @return {number[]}
 */
var shortestToChar = function(s, c) {
  const occurence = [];
  for (let i = 0; i < s.length; i++) {
    if (s[i] === c) occurence.push(i);
  }
  let ans = [...new Array(s.length).fill(0)];
  const set = new Set(occurence);
  for (let j = 0; j < s.length; j++) {
    if (set.has(j)) continue;
    let i = 0;
    while (i < occurence.length && occurence[i] < j) {
      i++;
    }
    if (i === occurence.length) {
      ans[j] = j - occurence[i - 1];
    } else if (i === 0) {
      ans[j] = occurence[0] - j;
    } else {
      ans[j] = occurence[i] - j < j - occurence[i - 1] ? occurence[i] - j : j - occurence[i - 1];
    }
  }
  return ans;
};
```