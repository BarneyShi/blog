---
title: Leetcode 1047 - Remove all adjacent dup in string
date: 2021-10-09 20:47:04
tags:
- stack
- array
---
**`Note:`**
- Check if you know how to use `stack`.

**`Question:`**

You are given a string s consisting of lowercase English letters. A duplicate removal consists of choosing two adjacent and equal letters and removing them.

We repeatedly make duplicate removals on s until we no longer can.

Return the final string after all such duplicate removals have been made. It can be proven that the answer is unique.

**`Example:`**
```
Input: s = "abbaca"
Output: "ca"
Explanation: 
For example, in "abbaca" we could remove "bb" since the letters are adjacent and equal, and this is the only possible move.  The result of this move is that the string is "aaca", of which only "aa" is possible, so the final string is "ca".
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {string}
 */
var removeDuplicates = function(s) {
  let stack = [];
  for (let i = 0; i < s.length; i++) {
    if (s[i] !== stack[stack.length - 1]) {
      stack.push(s[i]);
      continue;
    }
    stack.pop();
  }
  return stack.join('');
};
```