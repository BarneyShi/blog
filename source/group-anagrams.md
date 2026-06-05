---
title: Leetcode 49 - Group anagrams
date: 2021-11-01 21:23:30
tags:
---
**`Note:`**
- Using normal anagrams checkign is slow.
- Figure out a way to represnet anagrams such as using `num` to represent how many word from `a` to `z` and combine them with `.`.
- Store those reps in `map` and group same anagrams together while iterating.

**`Question:`**

Given an array of strings `strs`, group the anagrams together. You can return the answer in any order.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

**`Example:`**
```
Input: strs = ["eat","tea","tan","ate","nat","bat"]
Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
```

**`Code:`**
```javascript
/**
 * @param {string[]} strs
 * @return {string[][]}
 */
var groupAnagrams = function(strs) {
  let map = new Map();
  for (const s of strs) {
    const count = countRecurrence(s);
    if (map.has(count)) {
      map.get(count).push(s);
    } else {
      map.set(count, [s]);
    }
  }
  let result = [];
  for (const [key, val] of map) {
    result.push(val);
  }
  return result;

  function countRecurrence(str) {
    let count = Array(26).fill(0);
    for (const char of str) {
      count[char.charCodeAt(0) - 'a'.charCodeAt(0)]++;
    }
    return count.join('.');
  }
};
```