---
title: Leetcode 830 - Positions of Large Groups
date: 2022-01-05 16:10:02
tags:
---
**`Note:`**
- Use `double pointers` to find the length of the window.

**`Question:`**

In a string s of lowercase letters, these letters form consecutive groups of the same character.

For example, a string like s = "abbxxxxzyy" has the groups "a", "bb", "xxxx", "z", and "yy".

A group is identified by an interval `[start, end]`, where start and end denote the start and end indices (inclusive) of the group. In the above example, "xxxx" has the interval [3,6].

A group is considered large if it has `3` or `more` characters.

Return the intervals of every `large` group sorted in increasing order by start index.

**`Example:`**
```
Input: s = "abcdddeeeeaabbbcd"
Output: [[3,5],[6,9],[12,14]]
Explanation: The large groups are "ddd", "eeee", and "bbb".
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {number[][]}
 */
var largeGroupPositions = function(s) {
  let ans = [];
  let left = 0, right = 0;
  while (right < s.length) {
    while (s[right + 1] === s[right]) {
      right++;
    }
    if (right - left + 1 >= 3) ans.push([left, right]);
    right++;
    left = right;
  }
  return ans;
};
```