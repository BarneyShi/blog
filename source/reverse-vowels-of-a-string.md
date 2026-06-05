---
title: Leetcode 345 - Reverse vowels of a string
date: 2021-11-10 02:23:55
tags:
- double pointers
---
**`Note:`**
- Use `2D array` to initialize a map.
- Use `Double pointers`.

**`Question:`**

Given a string `s`, reverse only all the vowels in the string and return it.

The vowels are '`a`', '`e`', '`i`', '`o`', and '`u`', and they can appear in both cases.

**`Example:`**
```
Input: s = "leetcode"
Output: "leotcede"
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {string}
 */
var reverseVowels = function(s) {
  let map = new Map([['a',true], ['A',true], ['e', true], ['E',true], ['i', true], ['I',true], ['o', true], ['O',true], ['u', true], ['U',true]]);
  s = s.split('');
  let left = 0, right = s.length - 1;
  while (left < right) {
    while (left < right && !map.has(s[left])) {
      left++;
    }
    while (left < right && !map.has(s[right])) {
      right--;
    }
    [s[left], s[right]] = [s[right], s[left]];
    left++;
    right--;
  }
  return s.join('');
};
```