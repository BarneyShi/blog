---
title: Leetcode 451 - Sort Characters By Frequency
date: 2021-12-26 21:00:32
tags:
- hash table
---
**`Note:`**
- TIL that `Map` or `Set` can be converted into arrays through ES6 `[...map]` ([key, val] pairs) or `[...set]`.
- So if we just use `map`, we can quickly convert map into sortable array.

**`Question:`**

Given a string `s`, sort it in `decreasing order` based on the `frequency` of the characters. The `frequency` of a character is the number of times it appears in the string.

Return the sorted string. If there are multiple answers, return any of them.

**`Example:`**
```
Input: s = "tree"
Output: "eert"
Explanation: 'e' appears twice while 'r' and 't' both appear once.
So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {string}
 */
var frequencySort = function(s) {
  let map = new Map();
  for (const ch of s) {
    if (!map.has(ch)) {
      map.set(ch, 1);
    } else {
      map.set(ch, map.get(ch) + 1);
    }
  }
  let ans = [...map].sort((a, b) => b[1] - a[1]);
  return ans.map(e => e[0].repeat(e[1])).join('');
};
```

**Naive Way using array**
```javascript
/**
 * @param {string} s
 * @return {string}
 */
var frequencySort = function(s) {
  let letters = [...new Array(62)].map((e, i) => {
    let obj = {};
    if (i <= 9) {
      obj[i + ''] = 0;
      return obj
    } else if (i <= 35) {
      const char = String.fromCharCode(i + 55);
      obj[char] = 0;
      return obj;
    } else {
      const char = String.fromCharCode(i - 36 + 97);
      obj[char] = 0;
      return obj;
    }
  })
  for (const ch of s) {
    const code = ch.charCodeAt(0);
    if (code < 65) {
      letters[code - 48][ch]++;
    } else if (code < 97) {
      letters[code - 65 + 10][ch]++;
    } else {
      letters[code - 97 + 36][ch]++;
    }
  }
  letters.sort((a, b) => {
    let aKey = Object.keys(a)[0];
    let bKey = Object.keys(b)[0];
    return b[bKey] - a[aKey];
  })
  let ans = '';
  letters.forEach(e => {
    const k = Object.keys(e)[0];
    const v = Object.values(e)[0];
    ans += k.repeat(v);
  })
  return ans;
};
```