---
title: Leetcode 146 - LRU cache
date: 2021-11-12 21:58:41
tags:
- hash table
- linked list
---
**`Note:`**
- To `get` something is O(1), that must be a `hash`.
- But hash has `no order`. How can we know the updating order? We need another data structure.
- It can't be an array because searching is at least O(n) for array. It can't be a single linked list coz seaching is also O(n).
- Let's use a `double linked list`! And store the `reference in hash`.
- Use `dummyHead` and `dummyTail` are techniques in linked list to bring convenience.
- We need several helpers
  - `moveToHead(node)`.
  - `addToHead(node)`.
  - `removeLRUItem()`
  - `removeNodeFromList(node)`.

**`Question:`**

Design a data structure that follows the constraints of a `Least Recently Used (LRU) cache`.

Implement the `LRUCache` class:

- `LRUCache(int capacity)` Initialize the LRU cache with positive size `capacity`.
- `int get(int key)` Return the value of the `key` if the key exists, otherwise return -1.
- `void put(int key, int value)` Update the value of the `key` if the key exists. Otherwise, add the `key-value` pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
The functions `get` and `put` must each run in `O(1)` average time complexity.

**`Example:`**
```
Input
["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
Output
[null, null, null, 1, null, -1, null, -1, 3, 4]

Explanation
LRUCache lRUCache = new LRUCache(2);
lRUCache.put(1, 1); // cache is {1=1}
lRUCache.put(2, 2); // cache is {1=1, 2=2}
lRUCache.get(1);    // return 1
lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
lRUCache.get(2);    // returns -1 (not found)
lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
lRUCache.get(1);    // return -1 (not found)
lRUCache.get(3);    // return 3
lRUCache.get(4);    // return 4
```

**`Code:`**
```javascript
/**
 * @param {number} capacity
 */
var LRUCache = function(capacity) {
  this.capacity = capacity;
  this.hash = {};
  this.count = 0;
  this.dummyHead = new ListNode();
  this.dummyTail = new ListNode();
  this.dummyHead.next = this.dummyTail;
  this.dummyTail.prev = this.dummyHead;
};

/** 
 * @param {number} key
 * @return {number}
 */
LRUCache.prototype.get = function(key) {
  let node = this.hash[key];
  if (!node) return -1;
  this.moveToHead(node);
  return node.val;
};

/** 
 * @param {number} key 
 * @param {number} value
 * @return {void}
 */
LRUCache.prototype.put = function(key, value) {
  if (this.hash[key]) {
    let node = this.hash[key];
    node.val = value;
    this.moveToHead(node);
  } else {
    let node = new ListNode(key, value);
    if (this.count === this.capacity) {
      this.removeLRUItem();
    }
    this.addToHead(node);
    this.hash[key] = node;
    this.count++;
  }
};

LRUCache.prototype.moveToHead = function(node) {
  // Remove it
  this.removeNodeFromList(node);
  // Add
  this.addToHead(node);
}

LRUCache.prototype.removeNodeFromList = function(node) {
  node.prev.next = node.next;
  node.next.prev = node.prev;
}

LRUCache.prototype.removeLRUItem = function() {
  const tail = this.dummyTail.prev;
  this.removeNodeFromList(tail);
  delete this.hash[tail.key];
  this.count--;
}

LRUCache.prototype.addToHead = function(node) {
  // Add to head;
  node.prev = this.dummyHead;
  node.next = this.dummyHead.next;
  this.dummyHead.next.prev = node;
  this.dummyHead.next = node;
}

var ListNode = function (key, val) {
  this.key = key;
  this.val = val;
  this.next = null;
  this.prev = null; 
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * var obj = new LRUCache(capacity)
 * var param_1 = obj.get(key)
 * obj.put(key,value)
 */
```