---
title: Leetcode 706 - Design HashMap
date: 2021-12-24 02:54:53
tags:
- hash table
---
**`Note:`**
- Very similar to Leetcode705, use `mod` to find the index, but this time it contains pairs like `[key, value]`.

**`Question:`**

Design a HashMap without using any built-in hash table libraries.

Implement the `MyHashMap` class:

- `MyHashMap()` initializes the object with an empty map.
- `void put(int key, int value)` inserts a (key, value) pair into the HashMap. If the key already exists in the map, update the corresponding value.
- `int get(int key)` returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key.
- `void remove(key)` removes the key and its corresponding value if the map contains the mapping for the key.

**`Example:`**
```
Input
["MyHashMap", "put", "put", "get", "get", "put", "get", "remove", "get"]
[[], [1, 1], [2, 2], [1], [3], [2, 1], [2], [2], [2]]
Output
[null, null, null, 1, -1, null, 1, null, -1]

Explanation
MyHashMap myHashMap = new MyHashMap();
myHashMap.put(1, 1); // The map is now [[1,1]]
myHashMap.put(2, 2); // The map is now [[1,1], [2,2]]
myHashMap.get(1);    // return 1, The map is now [[1,1], [2,2]]
myHashMap.get(3);    // return -1 (i.e., not found), The map is now [[1,1], [2,2]]
myHashMap.put(2, 1); // The map is now [[1,1], [2,1]] (i.e., update the existing value)
myHashMap.get(2);    // return 1, The map is now [[1,1], [2,1]]
myHashMap.remove(2); // remove the mapping for 2, The map is now [[1,1]]
myHashMap.get(2);    // return -1 (i.e., not found), The map is now [[1,1]]
```

**`Code:`**
```javascript
var MyHashMap = function() {
  this.BASE = 769;
  this.map = [...new Array(769)].map(e => []);
};

/** 
 * @param {number} key 
 * @param {number} value
 * @return {void}
 */
MyHashMap.prototype.put = function(key, value) {
  const index = key % this.BASE;
  // k,v inside `pair` are passed by reference.
  for (const pair of this.map[index]) {
    if (pair[0] === key) {
      pair[1] = value;
      return;
    }
  }
  this.map[index].push([key, value]);
};

/** 
 * @param {number} key
 * @return {number}
 */
MyHashMap.prototype.get = function(key) {
  const index = key % this.BASE;
  if (this.map[index].length === 0) return -1;
  for (const [k, v] of this.map[index]) {
    if (k === key) return v;
  }
  return -1;
};

/** 
 * @param {number} key
 * @return {void}
 */
MyHashMap.prototype.remove = function(key) {
  const index = key % this.BASE;
  for (const [i, [k, v]] of this.map[index].entries()) {
    if (k === key) {
      this.map[index].splice(i, 1);
      return;
    }
  }
};

/**
 * Your MyHashMap object will be instantiated and called as such:
 * var obj = new MyHashMap()
 * obj.put(key,value)
 * var param_2 = obj.get(key)
 * obj.remove(key)
 */
```