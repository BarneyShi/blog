---
title: Leetcode 187 - Repeated dna sequences
date: 2021-11-30 16:37:27
tags:
- hash table
---
**`Note:`**
- Not the most optimal method as `L` grows.
- Use sliding window with `slice` to get new substrs and stroe them in `map`.

**`Question:`**

The DNA sequence is composed of a series of nucleotides abbreviated as 'A', 'C', 'G', and 'T'.

For example, "ACGAATTCCG" is a DNA sequence.
When studying DNA, it is useful to identify repeated sequences within the DNA.

Given a string s that represents a DNA sequence, return all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule. You may return the answer in any order.

**`Example:`**
```
Input: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
Output: ["AAAAACCCCC","CCCCCAAAAA"]
```

**`Code:`**
**`O(n * C)`**
```javascript
/**
 * @param {string} s
 * @return {string[]}
 */
var findRepeatedDnaSequences = function(s) {
  let left = 0, right = 0;
  let map = new Map();
  let res = [];
  while (right < s.length) {
    if (right - left + 1 < 10) {
      right++;
      continue;
    } else if (right - left + 1 === 10) {
      const str = s.slice(left, right + 1);
      if (!map.has(str)) {
        map.set(str, 1);
      } else {
        map.set(str, map.get(str) + 1);
      }
      left++;
      right++;
    }
  }
  for (const [key, val]of map) {
    if (val > 1) res.push(key);
  }
  return res;
};
```