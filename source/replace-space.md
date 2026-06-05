---
title: Leetcode - Replace space
date: 2021-10-11 01:44:17
tags:
- double pointers
- string
---
**`Note:`**
- Normal approach is pretty intuitive so we don't talk about it.
- For double pointers:
  - If there are `n` spaces in the string, the result will have `2n` more chars than the original.
  - Iterate string to find the `count` of spaces.
  - Append `2n` spaces to the stirng.
  - Convert it to `array` so we can mutate it. (String is immutable in JS)
  - `Left` pointer should be put at the end of the original string, and `right` is put at the end of the new string.
  - When `arr[left] === ' '`, replace `arr[right], arr[right-1], arr[right-2]` with `%20`.
  - Otherwise just `arr[right--] = arr[left--]`. (We don't even need to swap them because old chars will be covered by new chars.) 

**`Question:`**
Repalce every space in a string with `%20`

**`Example:`**
```
Input: = "We are happy."
Output："We%20are%20happy."
```

**`Normal approach`**
**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {string}
 */
var replaceSpace = function(s) {
  let res = '';
  for (let i = 0; i < s.length; i++) {
    if (s[i] === ' ') {
      res += '%20';
      continue;
    }
    res += s[i];
  }
  return res;
};
```

**`Double pointers`** (Save memory space)
```javascript
/**
 * @param {string} s
 * @return {string}
 */
var replaceSpace = function(s) {
  let spaceCount = 0;
  for (const char of s) {
    if (char === ' ') spaceCount++;
  }
  s = s + ' '.repeat(spaceCount * 2);
  let left = s.length - spaceCount*2 - 1;
  let right = s.length - 1;
  const arr = s.split('');
  while (left >= 0) {
    if (arr[left] !== ' ') {
      [arr[right], arr[left]] = [arr[left], arr[right]];
      left--;
      right--;
    } else {
      arr[right--] = '0';
      arr[right--] = '2';
      arr[right--] = '%';
      left--; 
    }
  }
  return arr.join('');

};
```