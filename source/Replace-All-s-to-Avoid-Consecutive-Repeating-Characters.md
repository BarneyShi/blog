---
title: Leetcode 1576 - Replace All ?'s to Avoid Consecutive Repeating Characters
date: 2022-01-04 16:44:11
tags:
---
**`Note:`**
- Meaningless problem. Just choose random char and deal with edge cases like consecutive `?`.

**`Question:`**

Given a string `s` containing only lowercase English letters and the `'?'` character, convert all the `'?'` characters into lowercase letters such that the final string does not contain any consecutive repeating characters. You cannot modify the non `'?'` characters.

It is guaranteed that there are no consecutive repeating characters in the given string except for `'?'`.

Return the final string after all the conversions (possibly zero) have been made. If there is more than one solution, return any of them. It can be shown that an answer is always possible with the given constraints.

**`Example:`**
```
Input: s = "?zs"
Output: "azs"
Explanation: There are 25 solutions for this problem. From "azs" to "yzs", all are valid. Only "z" is an invalid modification as the string will consist of consecutive repeating characters in "zzs".
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {string}
 */
var modifyString = function(s) {
  s = s.split('');
  for (let i = 0; i < s.length; i++) {
    if (s[i] !== '?') continue;
    let newChar = 'a';
    while (newChar === s[i - 1] || newChar === s[i + 1]) {
      newChar = String.fromCharCode(newChar.charCodeAt() + 1);
    }
    s[i] = newChar;
  }
  return s.join('');
};
```