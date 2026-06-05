---
title: Leetcode 1078 - Occurrences After Bigram
date: 2021-12-25 16:04:55
tags:
---
**`Note:`**
- Easy simulation problem.

**`Question:`**

Given two strings `first` and `second`, consider occurrences in some text of the form "`first second third`", where second comes immediately after `first`, and `third` comes immediately after `second`.

Return an `array` of all the words third for each occurrence of "first second third".

**`Example:`**
```
Input: text = "alice is a good girl she is a good student", first = "a", second = "good"
Output: ["girl","student"]
```

**`Code:`**
```javascript
/**
 * @param {string} text
 * @param {string} first
 * @param {string} second
 * @return {string[]}
 */
var findOcurrences = function(text, first, second) {
  text = text.split(' ');
  let ans = [];
  for (let i = 0; i < text.length; i++) {
    if (text[i] === first && text[i + 1] === second && text[i + 2]) {
      ans.push(text[i + 2]);
    } 
  }
  return ans;
};
```