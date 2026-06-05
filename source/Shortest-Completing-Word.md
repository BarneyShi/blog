---
title: Leetcode 748 - Shortest Completing Word
date: 2021-12-09 17:06:52
tags:
- simulation
---
**`Note:`**
- Weird question.
- Use hash table to record all frequencies of letters.
- Then copy `map` and for every letter that appears in both strings, do `minus 1` tp map val till it's `0`.
- Record the `count` and find the shortest.

**`Question:`**

Given a string `licensePlate` and an array of strings `words`, find the `shortest completing word` in words.

A completing word is a word that `contains all the letters` in licensePlate. `Ignore numbers and spaces` in licensePlate, and treat letters as `case insensitive`. If a letter appears more than once in licensePlate, then it must appear in the word the same number of times or more.

For example, if licensePlate = "aBc 12c", then it contains letters 'a', 'b' (ignoring case), and 'c' twice. Possible completing words are "abccdef", "caaacab", and "cbca".

Return the `shortest` completing word in words. It is guaranteed an answer exists. If there are `multiple` shortest completing words, return the `first` one that occurs in words.

**`Example:`**
```
Input: licensePlate = "1s3 PSt", words = ["step","steps","stripe","stepple"]
Output: "steps"
Explanation: licensePlate contains letters 's', 'p', 's' (ignoring case), and 't'.
"step" contains 't' and 'p', but only contains 1 's'.
"steps" contains 't', 'p', and both 's' characters.
"stripe" is missing an 's'.
"stepple" is missing an 's'.
Since "steps" is the only word containing all the letters, that is the answer.
```

**`Code:`**
```javascript
/**
 * @param {string} licensePlate
 * @param {string[]} words
 * @return {string}
 */
var shortestCompletingWord = function(licensePlate, words) {
  let map = new Map();
  for (let char of licensePlate) {
    char = char.toLowerCase();
    if (!map.has(char)) {
      map.set(char, 1);
    } else {
      map.set(char, map.get(char) + 1);
    }
  }
  let max = 0;
  let res;
  for (const word of words) {
    let count = 0;
    let wordMap = new Map(map);
    for (let char of word) {
      char = char.toLowerCase();
      if (wordMap.has(char) && wordMap.get(char) !== 0) {
        wordMap.set(char, wordMap.get(char) - 1);
        count++;
      }
    }
    // In case res is undefine, we need to check `count === 0` or not.
    if (count > max || (count !== 0 && count === max && word.length < res.length)) {
      max = count;
      res = word;
    }
  }
  return res;
};
```