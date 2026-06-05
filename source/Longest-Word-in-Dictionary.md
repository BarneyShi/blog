---
title: Leetcode 720 - Longest Word in Dictionary
date: 2021-12-24 03:40:19
tags:
- dfs
- trie
---
**`Note:`**
- Advance `Trie`:
  - Create a `Trie` class and insert every word.
  - Do `DFS` on paths whose `isEnd` is true.
  - Compare length and lexicographical order to return the ans.

- Naive `DFS`:
  - `dfs(statindex, len, currStr)`, start from `startIndex`, every time we find next str who is the same as `curr` except the last char, we do next `dfs(i + 1, len + 1, next)`.
  - Use a flag to denote whether we've found next str or not. If not, update ans[];
**`Question:`**

Given an array of strings `words` representing an English Dictionary, return the longest word in words that can be built one character at a time by other `words` in `words`.

If there is more than one possible answer, return the longest word with the smallest lexicographical order. If there is no answer, return the empty string.

**`Example:`**
```
Input: words = ["w","wo","wor","worl","world"]
Output: "world"
Explanation: The word "world" can be built one character at a time by "w", "wo", "wor", and "worl".
```

**`Code:`**

**Trie**
```javascript
/**
 * @param {string[]} words
 * @return {string}
 */
var longestWord = function(words) {
  const trie = new Trie();
  for (const word of words) {
    trie.insert(word);
  }
  return dfs(trie.children, '');

  function dfs(children, path) {
    children = Object.entries(children);
    let ans = '';
    for (const [c, nextChildren] of children) {
      if (nextChildren.isEnd) {
        const res = dfs(nextChildren, path + c);
        if (res.length > ans.length || res.length === ans.length && res < ans) ans = res;
      }
    }
    return ans === '' ? path : ans;
  }
};

class Trie {
  constructor() {
    this.children = {};
  }

  insert(word) {
    let children = this.children;
    for (const c of word) {
      if (!children[c]) {
        children[c] = {};
      }
      children = children[c];
    }
    children.isEnd = true;
  }
}
```

**DFS**
```javascript
/**
 * @param {string[]} words
 * @return {string}
 */
var longestWord = function(words) {
  words.sort((a, b) => a.length - b.length);
  let ans = [];
  dfs(0, 1, '');
  ans.sort((a, b) => {
    if (a < b) return -1;
    return 1;
  })
  return ans[0];

  function dfs(startIndex, len, str) {
    let hasNext = false;
    for (let i = startIndex; i < words.length; i++) {
      const curr = words[i];
      if (curr.length === len && curr.slice(0, len - 1) === str) {
        hasNext = true;
        dfs(i + 1, len + 1, curr);
      }
    }
    if (!hasNext) {
      if (ans.length === 0) {
        ans.push(str);
        return;
      }
      if (str.length < ans[0].length) return;
      if (str.length > ans[0].length) {
        ans = [str];
      } else {
        ans.push(str);
      }
    }
  }
};
```