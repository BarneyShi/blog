---
title: Leetcode 20 - Valid parentheses
date: 2021-10-09 19:28:58
tags:
- stack
- array
---
**`Note:`**
- This problem checks if you know about `stack`.
- Use a stack to record `(`, or `{`, or `[` we've met before.
- Keep popping elements from the stack when we encounter `]`, `}`, `)`, if the popped element doesn't match with the current char, return false.
- Check if `stack` is empty in the end.

**`Question:`**

Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

- Open brackets must be closed by the same type of brackets.
- Open brackets must be closed in the correct order.

**`Example:`**
```
Input: s = "()[]{}"
Output: true
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {boolean}
 */
var isValid = function(s) {
  let order = [];
  for (let i = 0; i < s.length; i++) {
    if (s[i] === '(' || s[i] === '{' || s[i] === '[') {
      order.push(s[i]);
    } else {
      if (s[i] === ')' && order.pop() !== '(' || s[i] === ']' && order.pop() !== '[' || s[i] === '}' && order.pop() !== '{' ) return false;
    }
  }
  return !order.length;
};
```