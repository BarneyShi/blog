---
title: Leetcode 383 - Ransom note
date: 2021-10-15 01:12:20
tags:
- hash table
- string
---
**`Note:`**
- It brings me memory of an interview, and I couldn't believe I used a whole different yet difficult approach in that interview. 
- Use `map` to store each char of `ranson note` with frequencies.
- Iterate through `magazine` and check if char is `in the map` and the value is `not 0`

**`Question:`**

Given two stings `ransomNote` and `magazine`, return true if ransomNote can be constructed from magazine and false otherwise.

Each letter in magazine can only be used `once` in ransomNote.

**`Example:`**
```
Input: ransomNote = "aa", magazine = "ab"
Output: false
```

**`Code:`**
```javascript
/**
 * @param {string} ransomNote
 * @param {string} magazine
 * @return {boolean}
 */
var canConstruct = function(ransomNote, magazine) {
  const map = new Map();
  for (let char of magazine) {
    if (!map.has(char)) {
      map.set(char, 1);
    } else {
      map.set(char, map.get(char) + 1);
    }
  }
  for (let char of ransomNote) {
    if (!map.has(char) || map.get(char) === 0) return false;
    map.set(char, map.get(char) - 1);
  }
  return true;
};
```