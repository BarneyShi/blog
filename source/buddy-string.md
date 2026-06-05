---
title: Leetcode 859 - Buddy string
date: 2021-11-22 14:26:33
tags:
- string
---
**`Note:`**
- Two situations:
  - `s === goal`, only if there are duplicates in them.
  - `s !== goal`, find the unmatched chars and check if they match after one of them being reversed.

**`Question:`**

Given two strings `s` and `goal`, return `true` if you can swap `two` letters in `s` so the result is equal to `goal`, otherwise, return `false`.

Swapping letters is defined as taking two indices `i` and `j` (0-indexed) such that `i != j` and swapping the characters at `s[i]` and `s[j]`.

For example, swapping at indices `0` and `2` in "`abcd`" results in "`cbad`".

**`Example:`**
```
Input: s = "ab", goal = "ba"
Output: true
Explanation: You can swap s[0] = 'a' and s[1] = 'b' to get "ba", which is equal to goal.

Input: s = "ab", goal = "ab"
Output: false
Explanation: The only letters you can swap are s[0] = 'a' and s[1] = 'b', which results in "ba" != goal.
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {string} goal
 * @return {boolean}
 */
var buddyStrings = function(s, goal) {
  if (s.length <= 1 || goal.length <= 1 || s.length !== goal.length) return false;
  let letters = [...Array(26).fill(0)];
  if (s === goal) {
    for (const char of s) {
      letters[char.charCodeAt(0) - 97]++;
      if (letters[char.charCodeAt(0) - 97] > 1) return true;
    }
  } else {
    let s_dismatch = [];
    let goal_dismatch = [];
    for (let i = 0; i < s.length; i++) {
      if (s[i] !== goal[i]) {
        s_dismatch.push(s[i]);
        goal_dismatch.push(goal[i]);
      }
    }
    if (s_dismatch.length === 2 && goal_dismatch.length === 2 && s_dismatch.join('.') === goal_dismatch.reverse().join('.')) return true; 
  }
  return false;
};
```