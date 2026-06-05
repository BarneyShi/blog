---
title: Leetcode 677 - Map sum pairs
date: 2021-11-13 19:33:30
tags:
- trie
- dfs
---
**`Note:`**
- ![img](https://i.imgur.com/KPsarHC.png)
- Use `Tire` data structure.
- Use `{}` instead of Map to store letters.
- Need a `DFS` helpe to search chars.
  - When `i <= prefix.length - 1`, only continue saerch on `key === prefix[i]`.
  - When `i >= prefix.length`, do normal DFS.
  - Only add `val` on two situations:
    - `i === prefix.length - 1` && `val` is defined.
    - `i >= prefix.length` && `val` is defined.

**`Question:`**

Design a map that allows you to do the following:

- Maps a string key to a given value.
- Returns the sum of the values that have a key with a prefix equal to a given string.

Implement the `MapSum` class:

- `MapSum()` Initializes the MapSum object.
- `void insert(String key, int val)` Inserts the `key-val` pair into the map. If the `key` already existed, the original `key-value` pair will be overridden to the new one.
- `int sum(string prefix)` Returns the sum of all the pairs' value whose key starts with the `prefix`.

**`Example:`**
```
Input
["MapSum", "insert", "sum", "insert", "sum"]
[[], ["apple", 3], ["ap"], ["app", 2], ["ap"]]
Output
[null, null, 3, null, 5]

Explanation
MapSum mapSum = new MapSum();
mapSum.insert("apple", 3);  
mapSum.sum("ap");           // return 3 (apple = 3)
mapSum.insert("app", 2);    
mapSum.sum("ap");           // return 5 (apple + app = 3 + 2 = 5)
```

**`Code:`**
```javascript

var MapSum = function () {
  this.children = {};
};

/** 
 * @param {string} key 
 * @param {number} val
 * @return {void}
 */
MapSum.prototype.insert = function (key, val) {
  let cur = this.children;
  for (const char of key) {
    if (cur[char]) {
      cur = cur[char];
    } else {
      cur[char] = {};
      cur = cur[char];
    }
  }
  // Define `val` AFTER finishing adding letters. At this moment `cur` is pointing at `endOfKey : {}`.
  cur.val = val;
};

/** 
 * @param {string} prefix
 * @return {number}
 */
MapSum.prototype.sum = function (prefix) {
  let res = 0;
  dfs(this.children, prefix, 0);
  return res;

  function dfs(children, prefix, i) {
    for (const key of Object.keys(children)) {
      if (i === prefix.length - 1 && key === prefix[i] && children[key].val || i >= prefix.length && children[key].val) res+= children[key].val;
      if (i <= prefix.length - 1 && key === prefix[i] || i >= prefix.length) {
        dfs(children[key], prefix, i + 1);
      }
    }
  }
};

/**
 * Your MapSum object will be instantiated and called as such:
 * var obj = new MapSum()
 * obj.insert(key,val)
 * var param_2 = obj.sum(prefix)
 */
```