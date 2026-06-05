---
title: Leetcode 438 - Find all anagrams in a string
date: 2021-11-27 19:04:08
tags:
- sliding window
- double pointers
---
**`Note:`**
- Use `array` instead of `hash table` to store counts. Because then we can quickly check if all number are `0` or `undefined`.
- When `array[charIndex] !== undefined`, move `right` by 1, and `minus 1` from `array[charIndex]`. 
  - If the `array[charIndex] === 0`, check if all elements are either `0` or `undefined`. If yes, we've found a res. Then move `left` by 1.
  - If `array[charIndex] < 0`, move `left` and keep adding `1` to `array[leftIndex]` till `array[charIndex] === 0`.
- If `array[charIndex] === undefined`, `right++, left = right`. And `RESET` the array we used to count.

**`Question:`**

Given two strings `s` and `p`, return an array of all the start indices of `p`'s anagrams in `s`. You may return the answer in any order.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

**`Example:`**
```
Input: s = "cbaebabacd", p = "abc"
Output: [0,6]
Explanation:
The substring with start index = 0 is "cba", which is an anagram of "abc".
The substring with start index = 6 is "bac", which is an anagram of "abc".
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {string} p
 * @return {number[]}
 */
 var findAnagrams = function(s, p) {
  if (s.length < p) return [];
  let res = [];
  let left = 0, right = 0;
  // Don't initialize them all as `0`.
  const map = [...Array(26)];
  for (const char of p) {
    const i = char.charCodeAt() - 97;
    if (map[i] === undefined) map[i] = 0;
    map[i]++;
  }
  let clone = [...map];
  while (right < s.length) {
    if (clone[s[right].charCodeAt() - 97] === undefined) {
      right++;
      left = right;
      clone = [...map];
    } else {
      clone[s[right].charCodeAt() - 97]--;
      if (clone[s[right].charCodeAt() - 97] === 0 && clone.every(e => e === 0 || e === undefined)) {
        res.push(left);
        clone[s[left].charCodeAt() - 97]++;
        left++;
      }
      if (clone[s[right].charCodeAt() - 97] < 0) {
        while (left < right) {
          const bool = s[left] === s[right];
          clone[s[left].charCodeAt() - 97]++;
          left++;
          if (bool) break;
        }
      }
      right++;
    }
  }
  return res;
};
```