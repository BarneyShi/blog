---
title: Leetcode 520 - Detect capital
date: 2021-11-12 15:16:03
tags:
- string
---
**`Note:`**
- Simplify the logic
- Word[i] after index 2 must have the same case as `word[1]`.
- The only exception is `aBBB`. We need to check if the first case is `lower` and the second is `upper`.

**`Question:`**

We define the usage of capitals in a word to be right when one of the following cases holds:

- All letters in this word are capitals, like "`USA`".
- All letters in this word are not capitals, like "`leetcode`".
- Only the first letter in this word is capital, like "`Google`".

Given a string `word`, return `true` if the usage of capitals in it is right.

**`Example:`**
```
Input: word = "FlaG"
Output: false
```

**`Code:`**
```javascript
/**
 * @param {string} word
 * @return {boolean}
 */
 var detectCapitalUse = function(word) {
  if (word.length === 1) return true;
  if (word[0] === word[0].toLowerCase() && word[1] === word[1].toUpperCase()) return false;
  for (let i = 1; i < word.length; i++) {
    if (word[1].toUpperCase() === word[1] ^ word[i].toUpperCase() === word[i]) return false;
  }
  return true;
};
```