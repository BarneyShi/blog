---
title: Leetcode 524 - Longest Word in Dictionary through Deleting
date: 2022-01-06 18:09:52
tags:
- double pointers
---
**`Note:`**
- This question is not that hard.
- How to check if `target` is a subsequence of `s`?
- `Double pointers`, one for `s` and one for `target`. If curr char is a match, move both pointers right by 1. If not, only move pointer of s.
- Sort `dict` by length and lexicographical order. So the first word to be found in s is our ans.

**`Question:`**

Given a string `s` and a string array `dictionary`, return the longest string in the dictionary that can be formed by deleting some of the given string characters. If there is more than one possible result, return the longest word with the smallest lexicographical order. If there is no possible result, return the empty string.

**`Example:`**
```
Input: s = "abpcplea", dictionary = ["ale","apple","monkey","plea"]
Output: "apple"
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {string[]} dictionary
 * @return {string}
 */
var findLongestWord = function(s, dictionary) {
  dictionary.sort((a, b) => {
    if (a.length !== b.length) return b.length - a.length;
    if (a < b) return -1;
    return 1;
  })
  for (const word of dictionary) {
    let ps = 0, pdict = 0;
    while (ps < s.length && pdict < word.length) {
      if (s[ps] === word[pdict]) {
        ps++;
        pdict++;
      } else {
        ps++;
      }
    }
    if (pdict === word.length) return word;
  }
  return '';
};
```