---
title: Leetcode 318 - Max product of word lengths
date: 2021-11-16 16:24:02
tags:
- bitwise
---
**`Note:`**
- Use a `26` length long array to represent each `letter`. If one letter appers, set its value to `1`.
- Join all value together to form a binary string.
- Iterate binary with double for loop and find the biggest product.
- Detail: To let JS know that a string is bianry, append `0b` to its front.

**`Question:`**

Given a string array `words`, return the maximum value of `length(word[i]) * length(word[j])` where the two words do not share common letters. If no such two words exist, return 0.

**`Example:`**
```
Input: words = ["abcw","baz","foo","bar","xtfn","abcdef"]
Output: 16
Explanation: The two words can be "abcw", "xtfn".
```

**`Code:`**
```javascript
/**
 * @param {string[]} words
 * @return {number}
 */
var maxProduct = function(words) {
  let letterCount = [...Array(words.length)];
  for (let i = 0; i < words.length; i++) {
    let binary = [...Array(26).fill(0)];
    for (const char of words[i]) {
      const index = char.charCodeAt(0) - 97;
      if (binary[index] !== 1) binary[index]++;
    }
    binary = binary.join('');
    letterCount[i] = binary;
  }
  let res = 0;
  for (let i = 0; i < words.length; i++) {
    for (let j = 0; j < i; j++) {
      if (('0b' + letterCount[i] & '0b' + letterCount[j]) === 0) {
        res = Math.max(res, words[i].length * words[j].length);
      }
    }
  }
  return res;
};
```