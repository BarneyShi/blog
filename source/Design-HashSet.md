---
title: Leetcode 705 - Design HashSet
date: 2021-12-23 19:52:26
tags:
- hash table
---
**`Note:`**
- Use `key % MOD` to get the index.
- To avoid hash collision, still need to check every e in `set[key % MOD]`.

**`Question:`**

Design a HashSet without using any built-in hash table libraries.

Implement `MyHashSet` class:

- `void add(key)` Inserts the value key into the HashSet.
- `bool contains(key)` Returns whether the value key exists in the HashSet or not.
- `void remove(key)` Removes the value key in the HashSet. If key does not exist in the HashSet, do nothing.

**`Example:`**
```
Input
["MyHashSet", "add", "add", "contains", "contains", "add", "contains", "remove", "contains"]
[[], [1], [2], [1], [3], [2], [2], [2], [2]]
Output
[null, null, null, true, false, null, true, null, false]

Explanation
MyHashSet myHashSet = new MyHashSet();
myHashSet.add(1);      // set = [1]
myHashSet.add(2);      // set = [1, 2]
myHashSet.contains(1); // return True
myHashSet.contains(3); // return False, (not found)
myHashSet.add(2);      // set = [1, 2]
myHashSet.contains(2); // return True
myHashSet.remove(2);   // set = [1]
myHashSet.contains(2); // return False, (already removed)
```

**`Code:`**
```javascript
var MyHashSet = function() {
  this.BASE = 769;
  this.hashSet = [...new Array(769)].map(e => []);
};

/** 
 * @param {number} key
 * @return {void}
 */
MyHashSet.prototype.add = function(key) {
  const index = key % this.BASE;
  if (this.contains(key)) return;
  this.hashSet[index].push(key);
};

/** 
 * @param {number} key
 * @return {void}
 */
MyHashSet.prototype.remove = function(key) {
  const index = key % this.BASE;
  for (let i = 0; i < this.hashSet[index].length; i++) {
    if (this.hashSet[index][i] === key){
      this.hashSet[index].splice(i, 1);
      return;
    }
  }
};

/** 
 * @param {number} key
 * @return {boolean}
 */
MyHashSet.prototype.contains = function(key) {
  const index = key % this.BASE;
  for (let i = 0; i < this.hashSet[index].length; i++) {
    if (this.hashSet[index][i] === key) return true;
  }
  return false;
};

/**
 * Your MyHashSet object will be instantiated and called as such:
 * var obj = new MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * var param_3 = obj.contains(key)
 */
```