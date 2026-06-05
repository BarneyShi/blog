---
title: Leetcode 423 - Reconstruct original digit from english
date: 2021-11-23 17:18:22
tags:
- simulation
---
**`Note:`**
- By the number of `z` find all 0s and remove z,e,r,o
- Then by `w` remove all `two`.
- Then by `x` remove all `six`....

**`Question:`**

Given a string `s` containing an out-of-order English representation of digits `0-9`, return the digits in ascending order.

**`Example:`**
```
Input: s = "owoztneoer"
Output: "012"
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {string}
 */
 var originalDigits = function(s) {
  let map = new Map();
  let res = [...Array(10)];
  for (let char of s) {
    char = char.toLowerCase();
    if (!map.has(char)) {
      map.set(char, 1);
    } else {
      map.set(char, map.get(char) + 1);
    }
  }
  const specials = [['z', 'zero', 0], ['w', 'two', 2], ['x', 'six', 6], ['s', 'seven', 7], ['g', 'eight', 8], ['v', 'five', 5], ['t', 'three', 3], ['r', 'four', 4], ['i', 'nine', 9], ['o', 'one', 1]];
  for (const [char, num, index] of specials) {
    if (map.has(char) && map.get(char) !== 0) {
      const count = map.get(char);
      res[index] = (index + '').repeat(count);
      for (const e of num) {
        map.set(e, map.get(e) - count);
      }
    }
  }
  return res.join('');
};
```