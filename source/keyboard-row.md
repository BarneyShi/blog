---
title: Leetcode 500 - Keyboard row
date: 2021-10-30 15:54:11
tags:
---
**`Note:`**
- Use `[]` to store each char on the same row.
- Use `lowercase` to compare.

**`Question:`**

![img](https://assets.leetcode.com/uploads/2018/10/12/keyboard.png)
Given an array of strings `words`, return the words that can be typed using letters of the alphabet on only one row of American keyboard like the image below.

In the American keyboard:

- the first row consists of the characters "qwertyuiop",
- the second row consists of the characters "asdfghjkl", and
- the third row consists of the characters "zxcvbnm".

**`Example:`**
```
Input: words = ["Hello","Alaska","Dad","Peace"]
Output: ["Alaska","Dad"]
```

**`Code:`**
```javascript
/**
 * @param {string[]} words
 * @return {string[]}
 */
var findWords = function(words) {
  let map1 = 'qwertyuiop'.split('');
  let map2 = 'asdfghjkl'.split('');
  let map3 = 'zxcvbnm'.split('');
  words = words.filter(e => {
    let map = map1.includes(e[0].toLocaleLowerCase()) ? map1 : (map2.includes(e[0].toLocaleLowerCase()) ? map2 : map3);
    for (const char of e) {
      if (!map.includes(char.toLocaleLowerCase())) return false;
    }
    return true;
  })
  return words;
}; 
```