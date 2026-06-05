---
title: Leetcode 472 - Concatenated Words
date: 2021-12-27 18:39:44
tags:
- dfs
- trie
---
**`Note:`**
- Can be done via brute force DFS + memo. Use `index` instead of `substr` as key cuz it's faster, and we don't need to do `slice()`.
- Advanced solution:
  - Consturct a Trie class.
  - Sort words in ascending order by length.
  - Do DFS on trie.

**`Question:`**

Given an array of strings `words` (without duplicates), return all the concatenated words in the given list of words.

A `concatenated` word is defined as a string that is comprised entirely of at least two shorter words in the given array.

**`Example:`**
```
Input: words = ["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]
Output: ["catsdogcats","dogcatsdog","ratcatdogcat"]
Explanation: "catsdogcats" can be concatenated by "cats", "dog" and "cats"; 
"dogcatsdog" can be concatenated by "dog", "cats" and "dog"; 
"ratcatdogcat" can be concatenated by "rat", "cat", "dog" and "cat".
```

**`Code:`**
```javascript
/**
 * @param {string[]} words
 * @return {string[]}
 */
 var findAllConcatenatedWordsInADict = function(words) {
  let set = new Set(words);
  let visited = {};
  let res = [];
  for (const w of words) {
    visited = {};
    if (w.length > 0 && dfs(0, w)) {
      res.push(w);
    }
  }
  return res;

  function dfs(startIndex, word) {
    if (startIndex >= word.length) return true;
    if (visited[startIndex] !== undefined) return visited[startIndex];
    let ans = false;
    for (let i = startIndex; i < word.length; i++) {
      const substr = word.slice(startIndex, i + 1);
      if (substr !== word && set.has(substr)) {
        ans = ans || dfs(i + 1, word);
      }
    }
    visited[startIndex] = ans;
    return ans;
  }
};
```