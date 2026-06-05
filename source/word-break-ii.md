---
title: Leetcode 140 - Word break II
date: 2021-11-15 20:31:38
tags:
- dfs
---
**`Note:`**
- Very typical `DFS` question.
- Use set to replace `wordDict` coz its `has()` is O(1).
- Use `pathLen` to check answers.
- Use `startIndex` to mark where to start.

**`Question:`**

Given a string `s` and a dictionary of strings `wordDict`, add spaces in `s` to construct a sentence where each word is a valid dictionary word. Return all such possible sentences in any order.

Note that the same word in the dictionary may be reused multiple times in the segmentation.

**`Example:`**
```
Input: s = "catsanddog", wordDict = ["cat","cats","and","sand","dog"]
Output: ["cats and dog","cat sand dog"]
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {string[]} wordDict
 * @return {string[]}
 */
var wordBreak = function(s, wordDict) {
  let result = [];
  let path = [];
  let wordSet = new Set(wordDict);
  dfs(s, 0, 0);
  return result.map(e => e.join(' '));

  function dfs(s, startIndex, pathLen) {
    if (pathLen === s.length) {
      result.push([...path]);
      return;
    }
    for (let i = startIndex; i < s.length; i++) {
      for (let j = startIndex + 1; j <= s.length; j++) {
        const str = s.slice(i, j);
        if (wordSet.has(str)) {
          path.push(str);
          dfs(s, j, pathLen + j - i);
          path.pop();
        }
      }
    }
  }
};
```