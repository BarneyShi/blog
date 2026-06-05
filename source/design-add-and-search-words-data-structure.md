---
title: Leetcode 211 - Design add and search words data structure
date: 2021-10-19 03:04:45
tags:
- trie
---
**`Note:`**
- `Trie`
  - Check if a string exsits in a data structure, `Trie` is the way to go. But we only need to implement `insert` for `trie` cause we need to implement another `DFS` search.
  - For searching, we need `DFS` as essentially `trie` is a tree,.
    - Param: we need to know current `trie` node and current `word[i]` of word. so `dfs(node, i)`
    - Base: When `i === word.length`, we need to check if `node.isEnd` is true. Otherwise it might not be true such as we search `app` toward `apple`.
    - When `word[i]` is `.`, we need to iterate on every letter of `trie`. In binary tree, we might do `return dfs(left) || dfs(right)`, but here its a n-ary tree. The techinique is to write `if (dfs(nextNode, i+1)) return true`.
    - When `word[i]` is not `.`, if `word[i]` is not presented in `node`, just return false. Otherwise, we need to keep doing dfs on next node and increase i by 1. `return dfs(node[word[i]], i+1)`

- `Regex`
  - Know how to replace `.` with `[a-z]`
    -  `word.replace(/\./g, '[a-z]')`
  - Know how to build regex with strings using `new Regex()`.
  - Know `search(regex)` returns `-1` if there is no match.

**`Question:`**

Design a data structure that supports adding new words and finding if a string matches any previously added string.

Implement the WordDictionary class:

- `WordDictionary()` Initializes the object.
- `void addWord(word)` Adds word to the data structure, it can be matched later.
- `bool search(word)` Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.

**`Example:`**
```
Input:
["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
[[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
Output
[null,null,null,null,false,true,true,true]

Explanation:
WordDictionary wordDictionary = new WordDictionary();
wordDictionary.addWord("bad");
wordDictionary.addWord("dad");
wordDictionary.addWord("mad");
wordDictionary.search("pad"); // return False
wordDictionary.search("bad"); // return True
wordDictionary.search(".ad"); // return True
wordDictionary.search("b.."); // return True
```

**`Code:`**

**`Trie`**
```javascript
var WordDictionary = function () {
  this.triNode = new Trie();
};

/** 
 * @param {string} word
 * @return {void}
 */
WordDictionary.prototype.addWord = function (word) {
  this.triNode.insert(word);
};

/** 
 * @param {string} word
 * @return {boolean}
 */
WordDictionary.prototype.search = function (word) {
  return dfs(this.triNode.children, 0);

  function dfs(node, i) {
    if (i === word.length) return node.isEnd ? true : false;
    if (word[i] !== '.') {
      if (!node[word[i]]) return false;
      return dfs(node[word[i]], i + 1);
    } else {
      for (const [char, child] of Object.entries(node)) {
        // This is technique for n-ary tree.
        if (dfs(child, i + 1)) return true;
      }
    }
    return false;
  }
};

// Create Trie
var Trie = function () {
  this.children = {};
}
Trie.prototype.insert = function (word) {
  let node = this.children;
  for (let char of word) {
    if (!node[char]) {
      node[char] = {};
    }
    node = node[char];
  }
  node.isEnd = true;
}
/**
 * Your WordDictionary object will be instantiated and called as such:
 * var obj = new WordDictionary()
 * obj.addWord(word)
 * var param_2 = obj.search(word)
 */
```

**`Regex`**
```javascript
var WordDictionary = function () {
  this.data = [];
};

/** 
 * @param {string} word
 * @return {void}
 */
WordDictionary.prototype.addWord = function (word) {
  this.data.push(word);
};

/** 
 * @param {string} word
 * @return {boolean}
 */
WordDictionary.prototype.search = function (word) {
  if (this.data.includes(word)) return true;
  if (!word.includes('.')) return false;
  const regex = /\./g;
  const target = word.replace(regex, '[a-z]');
  const searchRegex = new RegExp(`${target}`, 'g');
  for (let i = 0; i < this.data.length; i++) {
    if (this.data[i].length !== word.length) continue;
    if (this.data[i].search(searchRegex) !== -1) return true;
  }
  return false;
};
```