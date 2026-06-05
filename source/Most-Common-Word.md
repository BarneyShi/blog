---
title: Leetcode 819 - Most Common Word
date: 2021-12-29 03:42:12
tags:
---
**`Note:`**
- How to use multi delimiters in `split()`?
  - Use regex in split like `split(/\s+|[^a-zA-z]/)` 

**`Question:`**

Given a string `paragraph` and a string array of the banned words `banned`, return the most frequent word that is not banned. It is `guaranteed` there is `at least one word` that is not banned, and that the answer is unique.

The words in `paragraph` are `case-insensitive` and the answer should be returned in lowercase.

**`Example:`**
```
Input: paragraph = "Bob hit a ball, the hit BALL flew far after it was hit.", banned = ["hit"]
Output: "ball"
Explanation: 
"hit" occurs 3 times, but it is a banned word.
"ball" occurs twice (and no other word does), so it is the most frequent non-banned word in the paragraph. 
Note that words in the paragraph are not case sensitive,
that punctuation is ignored (even if adjacent to words, such as "ball,"), 
and that "hit" isn't the answer even though it occurs more because it is banned.
```

**`Code:`**
```javascript
/**
 * @param {string} paragraph
 * @param {string[]} banned
 * @return {string}
 */
var mostCommonWord = function(paragraph, banned) {
  paragraph = paragraph.split(/\s+|[^a-zA-z]/).map(e => e.replace(/[^a-zA-Z]/g, '').toLowerCase());
  let map = new Map();
  let bannedSet = new Set(banned);
  for (const p of paragraph) {
    if (bannedSet.has(p) || p.length === 0) continue;
    if (!map.has(p)) {
      map.set(p, 1);
    } else {
      map.set(p, map.get(p) + 1);
    }
  }
  let ans;
  let max = 0;
  for (const [k, v] of map) {
    if (v > max) {
      max = v;
      ans = k;
    }
  }
  return ans;
};
```