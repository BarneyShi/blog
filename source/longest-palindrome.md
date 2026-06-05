---
title: Leetcode 409 - Longest palindrome
date: 2021-11-13 20:08:17
tags:
- hash table
---
**`Note:`**
- Include all letters that appear `even` times.
- For letters that appear `odd` numbers. Find the `largest odd` num.
- If there is `other odd nums`, `minus 1` from each `odd` num then add them to the res.

**`Question:`**

Given a string `s` which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.

Letters are case sensitive, for example, "`Aa`" is not considered a palindrome here.

**`Example:`**
```
Input: s = "abccccdd"
Output: 7
Explanation:
One longest palindrome that can be built is "dccaccd", whose length is 7.
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {number}
 */
var longestPalindrome = function(s) {
  let map = new Map();
  for (const char of s) {
    if (!map.has(char)) {
      map.set(char, 1);
    } else {
      map.set(char, map.get(char) + 1);
    }
  }
  let evenNumSum = 0;
  let oddNumsCount = 0;
  let oddNumsSum = 0;
  let longestOdd = 0;
  for (const [key, val] of map) {
    if (val % 2 === 1) {
      longestOdd = Math.max(longestOdd, val);
      oddNumsCount++;
      oddNumsSum += val;
    } else {
      evenNumSum += val;
    }
  }
  return evenNumSum + (oddNumsCount > 1 ? (oddNumsSum - oddNumsCount + 1) : longestOdd);
};
```