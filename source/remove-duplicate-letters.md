---
title: Leetcode 316 - Remove duplicate letters
date: 2021-12-05 21:41:23
tags:
- monotonic stack
- greedy
---
**`Note:`**
- What kind of structure can we use to preserve an `ascending order`? - Monotonic stack
- However, if a char `won't appear again`, we cannot just pop it. So we need an `count[]` array.
- Also, if we've popped every char that we can pop in the stack, what if the `char` is aleady in the `stack`? 
- If it's been in stack, which means those chars in the stack has already been in `lexicographical` order. There is no need to pop any chars out and add an already `existing` char.

**`Question:`**

Given a string `s`, remove duplicate letters so that every letter appears once and only once. You must make sure your result is the smallest in `lexicographical` order among all possible results.

**`Example:`**
```
Input: s = "bcabc"
Output: "abc"
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {string}
 */
var removeDuplicateLetters = function(s) {
  let count = [...Array(26).fill(0)];
  for (const c of s) {
    count[c.charCodeAt(0) - 'a'.charCodeAt(0)]++;
  }
  let isInside = [...Array(26).fill(false)];
  let monoStack = [];
  for (const char of s) {
    // Minus 1 from count first.
    count[char.charCodeAt() - 'a'.charCodeAt()]--;
    if (isInside[char.charCodeAt() - 'a'.charCodeAt()]) continue;
    while (char < monoStack[monoStack.length - 1] && count[monoStack[monoStack.length - 1].charCodeAt() - 'a'.charCodeAt()] > 0) {
      const w = monoStack.pop();
      isInside[w.charCodeAt() - 'a'.charCodeAt()] = false;
    }
    monoStack.push(char);
    isInside[char.charCodeAt() - 'a'.charCodeAt()] = true;
  }
  return monoStack.join('');
};
```